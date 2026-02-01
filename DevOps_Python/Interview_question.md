Here are three simple ways to create 3 S3 buckets using:

✅ Bash (AWS CLI)
✅ Python (boto3)
✅ Terraform

I’ll keep each one copy-paste ready.

✅ 1️⃣ Create 3 S3 Buckets Using Bash (AWS CLI)
Requirements

AWS CLI installed

Configured with aws configure

Bucket names must be globally unique

Bash Script
#!/bin/bash

REGION="us-east-1"

BUCKETS=(
my-demo-bucket-001
my-demo-bucket-002
my-demo-bucket-003
)

for bucket in "${BUCKETS[@]}"
do
  aws s3api create-bucket \
    --bucket $bucket \
    --region $REGION \
    --create-bucket-configuration LocationConstraint=$REGION

  echo "Created bucket: $bucket"
done


Run:

chmod +x create_buckets.sh
./create_buckets.sh

✅ 2️⃣ Create 3 S3 Buckets Using Python (boto3)
Install boto3
pip install boto3

Python Script
import boto3

region = "us-east-1"

buckets = [
    "my-demo-bucket-101",
    "my-demo-bucket-102",
    "my-demo-bucket-103"
]

s3 = boto3.client("s3", region_name=region)

for bucket in buckets:
    s3.create_bucket(
        Bucket=bucket,
        CreateBucketConfiguration={
            'LocationConstraint': region
        }
    )
    print(f"Created bucket: {bucket}")


Run:

python create_buckets.py

✅ 3️⃣ Create 3 S3 Buckets Using Terraform
Terraform File: main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "my-demo-bucket-201"
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "my-demo-bucket-202"
}

resource "aws_s3_bucket" "bucket3" {
  bucket = "my-demo-bucket-203"
}

Run Terraform
terraform init
terraform plan
terraform apply

✅ Better Terraform Method — Using Loop (Cleaner)
provider "aws" {
  region = "us-east-1"
}

variable "bucket_names" {
  default = [
    "my-demo-bucket-301",
    "my-demo-bucket-302",
    "my-demo-bucket-303"
  ]
}

resource "aws_s3_bucket" "buckets" {
  for_each = toset(var.bucket_names)
  bucket   = each.value
}

⚠️ Important Notes

Bucket names must be globally unique

Avoid uppercase letters

Use hyphens instead of underscores

Make sure AWS credentials are configured


🐍 ✅ 50 Python DevOps / Cloud Coding Practice Questions
🔹 Python Basics + Automation

Write Python script to create 3 files

Read file line by line

Count word frequency in file

Parse JSON file

Convert JSON → CSV

Read environment variables

Validate input arguments

Add logging to script

Handle exceptions properly

Retry function on failure

🔹 File + OS Automation

List files older than X days

Delete temp files

Zip a directory

Extract archive

Monitor directory for new files

Rename files in bulk

Check disk usage

Execute shell command from Python

Capture command output

Monitor process status

🔹 AWS boto3 Practice

Create S3 bucket

Enable versioning

Upload file to S3

Download file

List all buckets

Create EC2 instance

Stop instances with tag

List AMIs

Create IAM user

Attach IAM policy

🔹 Cloud Automation Tasks

Delete snapshots older than X days

Tag all resources

Audit unused volumes

List idle load balancers

Check security groups with open ports

🔹 API + DevOps Tasks

Call REST API

Parse API response

Handle pagination

Authenticate with token

Build simple webhook listener

🔹 DevOps Utilities

Parse log files

Extract errors from logs

Monitor CPU usage

Send alert email

Create health check script

🔹 Advanced Practice

Multithreaded downloader

Async API calls

Config-driven automation

Build CLI tool with argparse

Write reusable automation module

🐚 ✅ 50 Bash DevOps Coding Practice Questions
🔹 Bash Fundamentals

Write hello world script

Use positional parameters

Read user input

If/else condition

Case statement

For loop

While loop

Functions in bash

Exit codes

Trap signals

🔹 File Operations

Find files older than X days

Delete files by pattern

Count lines in files

Replace string in files

Rename files in loop

Check if file exists

Compare two files

Monitor file changes

Tail logs live

Merge files

🔹 Text Processing

Use grep with regex

awk column extract

sed replace text

Sort + unique lines

Parse CSV

Extract JSON using jq

Extract IPs from logs

Count errors in logs

Filter by date

Parse command output

🔹 System Automation

Check service status

Restart if down

Monitor disk usage

Monitor memory

Kill process by name

List top processes

Cron job script

Backup script

Rotate logs

Health check script

🔹 AWS CLI Bash Tasks

Create S3 buckets loop

Upload files to S3

List EC2 instances

Stop tagged instances

Create security group

🔹 Advanced Bash Tasks

Retry on failure

Parallel execution

Menu-driven script

Script with logging

Error handling framework

🌍 ✅ 50 Terraform Practice Questions
🔹 Terraform Basics

Create S3 bucket

Create EC2 instance

Create security group

Create VPC

Create subnet

Create IAM role

Create EBS volume

Create load balancer

Create RDS

Create autoscaling group

🔹 Variables + Inputs

Use variables

Default values

Variable validation

Sensitive variables

tfvars file

🔹 Loops + Meta Arguments

Use count

Use for_each

Dynamic blocks

Conditional resources

Loop resources from list

🔹 Modules

Create module

Use module

Pass variables to module

Output from module

Version modules

🔹 State Management

Remote backend S3

DynamoDB locking

State import

State rm

State mv

🔹 Terraform Structure

Multi-env setup

Dev/prod workspaces

Folder structure

Reusable code

DRY principles

🔹 Advanced Terraform

Data sources

Depends_on

Lifecycle rules

Ignore changes

Prevent destroy

🔹 Real Interview Tasks

Create 3 S3 buckets with loop

Tag all resources

Enable versioning on buckets

Create VPC module

Create EC2 with user_data

🔹 Production Scenarios

Blue/green infra

Multi-region setup

Conditional env deploy

Partial apply strategy

Destroy selective resources