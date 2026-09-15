**Project: High-Availability Django Application on AWS using Terraform**

I built a production-style, highly available Django application infrastructure on AWS using **Terraform and Docker**.

The main objective was to deploy the Django application in a way that could **handle instance failures, distribute traffic, and automatically scale based on demand**, while keeping the application servers private and inaccessible directly from the internet.

### 1. Architecture

The architecture starts with the **Internet-facing Application Load Balancer**.

Traffic follows this path:

**Internet → ALB → Private EC2 Instances → Django Docker Container**

I created a custom **VPC with CIDR 10.0.0.0/16 across two Availability Zones** — `us-east-1a` and `us-east-1b`.

Each AZ contains:

* One public subnet for the ALB
* One private subnet for EC2 instances
* One NAT Gateway for outbound internet access

The ALB is deployed across both public subnets, while the EC2 instances run only in the private subnets.

### 2. High Availability

For high availability, I used **two Availability Zones**.

The ALB distributes incoming requests between EC2 instances in different AZs.

I also deployed **one NAT Gateway per AZ**. This avoids making a single NAT Gateway a dependency for the entire application.

If an EC2 instance or an entire Availability Zone has an issue, the ALB and Auto Scaling Group can continue serving traffic through the healthy infrastructure.

### 3. Auto Scaling

I created an **Auto Scaling Group** with:

* Minimum: 1 instance
* Desired: 2 instances
* Maximum: 5 instances

The ASG automatically launches replacement instances if an instance becomes unhealthy.

I also configured CPU-based scaling policies. When CPU utilization increases, the ASG can launch additional instances, up to the maximum of five.

When demand decreases, instances can scale back down.

This provides both **availability and elasticity**.

### 4. Security

Security was an important part of the design.

The EC2 instances are placed in **private subnets**, so they don't have public IP addresses and cannot be directly accessed from the internet.

The security groups follow a layered approach:

**ALB Security Group**

* Allows HTTP traffic from the internet.

**EC2 Security Group**

* Allows application traffic only from the ALB security group.
* The application runs on port 8000 inside the container.

So users cannot directly access the EC2 instances. They must go through the ALB.

The NAT Gateway is used only for outbound communication from the private instances, such as downloading packages or pulling Docker images.

### 5. Docker

The Django application runs inside a Docker container.

The EC2 instances are initialized using a **user-data script**.

During instance startup, the script installs the required Docker components, pulls the Django image:

`itsbaivab/django-app`

and starts the container.

The container exposes Django on port **8000**, which is mapped to the instance's application port used by the load balancer.

This makes application deployment consistent across all instances.

### 6. Terraform

The entire infrastructure is defined using Terraform.

I separated the configuration into different files based on responsibility:

* `main.tf` — Terraform and AWS provider configuration
* `variables.tf` — configurable inputs
* `vpc.tf` — VPC, subnets, NAT gateways and routing
* `security_groups.tf` — security groups
* `alb.tf` — ALB, target group and listener
* `asg.tf` — launch template, Auto Scaling Group and scaling policies
* `outputs.tf` — useful outputs such as ALB DNS
* `user_data.sh` — EC2 initialization

This gives me **Infrastructure as Code**, so the complete environment can be recreated consistently instead of manually configuring AWS resources.

### 7. Deployment

The deployment process is straightforward:

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

Terraform creates the networking, NAT gateways, security groups, ALB, target group, launch template and Auto Scaling Group.

After deployment, I retrieve the ALB DNS name:

```bash
terraform output load_balancer_dns
```

and access the Django application through the ALB.

### 8. Why this architecture?

The key design decisions were:

**ALB:** Distributes traffic and provides a single entry point.

**Multi-AZ:** Protects against failure of an individual Availability Zone.

**Private EC2:** Prevents direct internet access to application servers.

**NAT Gateway:** Provides controlled outbound internet access to private instances.

**Auto Scaling:** Automatically adjusts capacity according to demand and replaces unhealthy instances.

**Docker:** Provides a consistent application runtime.

**Terraform:** Makes the infrastructure repeatable, version-controlled and automated.

### 9. Cost consideration

One important lesson from the project is that high availability comes with additional cost.

The biggest cost components in this architecture are the **two NAT Gateways and the ALB**.

For a production environment, I would evaluate whether two NAT Gateways are required based on availability requirements and traffic patterns, because NAT Gateway hourly and data-processing charges can become significant.

### 10. Final interview summary

If I had to explain the project in 30 seconds, I would say:

> "I deployed a containerized Django application on AWS using Terraform with a highly available, multi-AZ architecture. I created a VPC across two Availability Zones with public and private subnets. An internet-facing Application Load Balancer distributes traffic to EC2 instances running Django containers in private subnets. The EC2 instances are managed by an Auto Scaling Group with a desired capacity of two and scaling from one to five instances based on CPU utilization. I used NAT Gateways to provide outbound internet access from the private subnets and configured security groups so that the EC2 instances accept application traffic only from the ALB. The entire infrastructure is managed through Terraform, making the deployment repeatable and automated."
