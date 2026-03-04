import boto3
from datetime import datetime, timedelta, timezone

INSTANCE_ID = "i-xxxxxxxxxxxxxxxxx"  # replace with your EC2 instance ID
REGION = "us-east-1"

def get_cpu_utilization(instance_id):
    cloudwatch = boto3.client("cloudwatch", region_name=REGION)

    end_time = datetime.now(timezone.utc)
    start_time = end_time - timedelta(hours=1)

    response = cloudwatch.get_metric_statistics(
        Namespace="AWS/EC2",
        MetricName="CPUUtilization",
        Dimensions=[
            {
                "Name": "InstanceId",
                "Value": instance_id
            }
        ],
        StartTime=start_time,
        EndTime=end_time,
        Period=300,  # 5 minutes
        Statistics=["Average"]
    )

    datapoints = response["Datapoints"]

    if not datapoints:
        print("No data found.")
        return

    for point in sorted(datapoints, key=lambda x: x["Timestamp"]):
        print(f"Time: {point['Timestamp']} | CPU: {point['Average']:.2f}%")

if __name__ == "__main__":
    get_cpu_utilization(INSTANCE_ID)