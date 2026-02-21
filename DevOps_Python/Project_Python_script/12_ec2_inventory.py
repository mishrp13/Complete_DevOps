import boto3

def get_ec2_inventory(region="us-east-1"):
    ec2 = boto3.client("ec2", region_name=region)

    response = ec2.describe_instances()

    print(f"{'Instance ID':20} {'State':15} {'Name'}")
    print("-" * 60)

    for reservation in response["Reservations"]:
        for instance in reservation["Instances"]:
            instance_id = instance["InstanceId"]
            state = instance["State"]["Name"]

            # Default name if no Name tag exists
            name = "N/A"
            if "Tags" in instance:
                for tag in instance["Tags"]:
                    if tag["Key"] == "Name":
                        name = tag["Value"]

            print(f"{instance_id:20} {state:15} {name}")

if __name__ == "__main__":
    get_ec2_inventory()