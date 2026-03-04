import boto3
from datetime import datetime, timedelta

# Configuration
REGION = "us-east-1"
CPU_THRESHOLD = 5.0  # percent
CHECK_DURATION_MINUTES = 60

ec2 = boto3.client("ec2", region_name=REGION)
cloudwatch = boto3.client("cloudwatch", region_name=REGION)

def get_running_instances():
    instances = []
    response = ec2.describe_instances(
        Filters=[{"Name": "instance-state-name", "Values": ["running"]}]
    )

    for reservation in response["Reservations"]:
        for instance in reservation["Instances"]:
            instances.append(instance["InstanceId"])

    return instances

def get_average_cpu(instance_id):
    end_time = datetime.utcnow()
    start_time = end_time - timedelta(minutes=CHECK_DURATION_MINUTES)

    metrics = cloudwatch.get_metric_statistics(
        Namespace="AWS/EC2",
        MetricName="CPUUtilization",
        Dimensions=[{"Name": "InstanceId", "Value": instance_id}],
        StartTime=start_time,
        EndTime=end_time,
        Period=300,
        Statistics=["Average"],
    )

    datapoints = metrics["Datapoints"]
    if not datapoints:
        return 0.0
    
    avg_cpu = sum(dp["Average"] for dp in datapoints) / len(datapoints)
    return avg_cpu

def stop_idle_instances():
    instances = get_running_instances()

    for instance_id in instances:
        cpu = get_average_cpu(instance_id)
        print(f"Instance {instance_id} | Avg CPU: {cpu:.2f}%")

        if cpu < CPU_THRESHOLD:
            print(f"Stopping idle instance: {instance_id}")
            ec2.stop_instances(InstanceIds=[instance_id])

if __name__ == "__main__":
    stop_idle_instances()