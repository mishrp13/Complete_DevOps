import boto3

def get_bucket_size(s3_client, bucket_name):
    """Calculate approximate size of an S3 bucket in bytes"""
    total_size = 0

    paginator = s3_client.get_paginator('list_objects_v2')

    try:
        for page in paginator.paginate(Bucket=bucket_name):
            if 'Contents' in page:
                for obj in page['Contents']:
                    total_size += obj['Size']
    except Exception as e:
        print(f"Error accessing bucket {bucket_name}: {e}")
        return None

    return total_size


def main():
    s3 = boto3.client('s3')

    # List all buckets
    response = s3.list_buckets()
    buckets = response['Buckets']

    print("\nS3 Bucket Audit Report")
    print("=" * 40)

    for bucket in buckets:
        bucket_name = bucket['Name']
        print(f"\nBucket Name: {bucket_name}")

        size = get_bucket_size(s3, bucket_name)

        if size is not None:
            size_mb = size / (1024 * 1024)
            print(f"Approximate Size: {size_mb:.2f} MB")
        else:
            print("Could not calculate size.")


if __name__ == "__main__":
    main()