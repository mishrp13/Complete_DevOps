import boto3
from datetime import datetime, timezone, timedelta

# Configuration
BUCKET_NAME = "your-bucket-name"
DAYS_OLD = 30  # Change this to your requirement

def delete_old_objects(bucket_name, days_old):
    s3 = boto3.client("s3")

    # Calculate cutoff date
    cutoff_date = datetime.now(timezone.utc) - timedelta(days=days_old)

    print(f"Deleting objects older than {days_old} days...")
    print(f"Cutoff date: {cutoff_date}")

    response = s3.list_objects_v2(Bucket=bucket_name)

    if "Contents" not in response:
        print("No objects found in bucket.")
        return

    for obj in response["Contents"]:
        key = obj["Key"]
        last_modified = obj["LastModified"]

        if last_modified < cutoff_date:
            print(f"Deleting {key} (Last Modified: {last_modified})")
            s3.delete_object(Bucket=bucket_name, Key=key)

    print("Cleanup completed.")

if __name__ == "__main__":
    delete_old_objects(BUCKET_NAME, DAYS_OLD)