import boto3
from botocore.exceptions import NoCredentialsError, ClientError

# This script checks whether your system is authenticated to AWS 
# and tells you which AWS account you are logged into.


def verify_aws_credentials():
    try:
        # Create STS client
        sts_client = boto3.client("sts")

        # Get caller identity
        response = sts_client.get_caller_identity()

        account_id = response["Account"]
        arn = response["Arn"]

        print("✅ AWS credentials are valid")
        print(f"🔹 Account ID: {account_id}")
        print(f"🔹 ARN: {arn}")

    except NoCredentialsError:
        print("❌ AWS credentials not found")
    except ClientError as e:
        print("❌ AWS credentials are invalid")
        print(e)

if __name__ == "__main__":
    verify_aws_credentials()
