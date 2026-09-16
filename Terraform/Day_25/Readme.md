This lecture explains Terraform resource migration/import—especially how to bring resources that were created manually in AWS under Terraform management. The instructor covers three approaches and then demonstrates the native terraform import method with an AWS Security Group and EC2 instance.

1. Why do we need Terraform Import?

Imagine you already have AWS resources such as:

VPC
S3 bucket
EC2 instance
RDS database
Security groups

but they were created manually, before your team started using Terraform.

If you now write Terraform configuration for one of these resources and run terraform apply, Terraform doesn't automatically know that the resource already exists. It may try to create another one, resulting in errors such as "resource already exists."

Solution → terraform import

Import tells Terraform:

"This existing cloud resource should now be managed by this Terraform resource."

The resource's information is then recorded in the Terraform state.

2. Terraform State — Very Important

The lecture emphasizes that the Terraform state file (terraform.tfstate) is extremely important.

Think of it as Terraform's record of the infrastructure it manages.

Terraform configuration (.tf files) → desired state
Terraform state → information about the infrastructure Terraform is managing

Terraform uses the state to determine what needs to change instead of having to discover everything from the cloud provider every time.

Important distinction

A resource can exist in AWS but not exist in Terraform state.

For example:

AWS
 └── EC2 instance exists

Terraform State
 └── EC2 instance NOT present

Terraform therefore doesn't consider that EC2 instance to be one of its managed resources.

After import:

AWS
 └── EC2 instance exists
          ↑
          │
Terraform State
 └── EC2 instance recorded

Now Terraform can manage it.

3. Three methods discussed

The instructor discusses three ways of migrating existing infrastructure into Terraform:

Method	Purpose
Terraform Import	Native Terraform method
Terraformer	Open-source CLI tool that generates Terraform configuration
AWS2TF	CLI tool that generates Terraform configuration for AWS

The lecture recommends learning and using native Terraform import, despite requiring more manual work.

Terraformer / AWS2TF

These tools can inspect existing infrastructure and generate Terraform files, reducing the amount of manual configuration required. For example, AWS2TF can inspect VPCs and generate Terraform configuration for them.

Terraformer supports multiple cloud providers and can generate configuration based on selected resources, regions and filters.

The lecture notes that these third-party tools can have limitations, bugs, or incomplete resource support, which is one reason the native Terraform approach is preferred in the lecture.

4. How Terraform Import works

The basic process demonstrated is:

Existing AWS Resource
        ↓
Write Terraform resource block
        ↓
terraform import
        ↓
Resource added to Terraform state
        ↓
terraform plan
        ↓
Make configuration match actual resource
        ↓
Terraform manages the resource

An important point is that import does not magically create the Terraform configuration for you in the approach demonstrated.

You first create the Terraform resource block with the required configuration, then import the existing resource into that resource address.

5. Demo: Importing an AWS Security Group

The instructor creates an AWS Security Group manually with rules for:

HTTP — port 80
HTTPS — port 443
SSH

Then he creates a corresponding Terraform configuration.

Initially, Terraform doesn't know about the manually-created Security Group.

So:

terraform plan

indicates that Terraform wants to create it.

If you actually apply it, AWS reports that the Security Group already exists.

Import command

The instructor then uses:

terraform import <resource-address> <resource-id>

For the Security Group, the resource address corresponds to the Terraform resource and the ID is the AWS Security Group ID. The import succeeds.

6. terraform state list

After importing, the instructor runs:

terraform state list

This shows the resources currently tracked by Terraform.

The important observation is that the Security Group appears in the state, while the VPC was only being accessed through a data source and had not itself been imported.

7. terraform state show

You can inspect the state information for a particular resource using:

terraform state show <resource-address>

This lets you see information Terraform has stored about the imported resource, including identifiers and other attributes.

8. Why terraform plan may still show changes after import

This is one of the most important lessons from the demo.

Importing the resource doesn't necessarily mean your .tf configuration exactly matches the real AWS resource.

For example, the Security Group had a different description.

Terraform therefore showed that it wanted to change the resource.

Eventually, the instructor changed the Terraform configuration so that the description matched the existing AWS resource.

Then:

No changes.
Your infrastructure matches the configuration.

This demonstrates that after import, you should run:

terraform plan

and reconcile differences between the Terraform configuration and the actual resource.

Key idea

Import ≠ configuration automatically becomes perfect.

Import puts the resource into Terraform's state. You still need to make the Terraform configuration accurately represent the resource.

9. After import, Terraform can modify the resource

Once the Security Group was successfully imported and its configuration matched the actual resource, the instructor added a tag:

managed by = Terraform

Then:

terraform plan
terraform apply

Terraform updated the existing AWS Security Group rather than creating a new one.

This proves that the manually-created resource is now being managed by Terraform.

10. Importing an EC2 instance

The same concept is then demonstrated with an EC2 instance.

The instructor creates the corresponding Terraform resource block and supplies information such as:

AMI
instance type
tags
subnet
security group association

Then he runs:

terraform import aws_instance.example <instance-id>

The import succeeds, and:

terraform plan

shows no changes because the configuration matches the imported instance.

The instructor then modifies the EC2 instance by adding a Terraform-related tag and applies it, demonstrating that Terraform can now manage the imported instance.

11. Important use case: Lost Terraform State

The lecture highlights an important interview question:

What if you accidentally delete your Terraform state file?

Normally, the preferred solution would be to restore the state from a backup.

But if no backup or replica is available, the instructor explains that terraform import can be used to reconstruct Terraform's knowledge of existing resources by importing them back into state.

So remember:

Lost terraform.tfstate
        ↓
Restore backup if possible
        ↓
If no backup → terraform import existing resources
⭐ Exam/Interview Notes
What is Terraform Import?

Terraform import is used to bring an existing infrastructure resource into Terraform's state so that Terraform can manage it.

Why is it needed?

When a resource already exists in the cloud but isn't in Terraform state, Terraform doesn't know that it should manage that resource.

Basic syntax
terraform import <resource-address> <resource-id>

Example:

terraform import aws_instance.example i-1234567890abcdef
Useful state commands
terraform state list

→ Lists resources tracked by Terraform.

terraform state show <resource>

→ Displays details stored in state for a resource.

Three methods from the lecture
1. terraform import     ← native Terraform
2. Terraformer
3. AWS2TF
Most important concept

The resource can already exist in AWS, but Terraform cannot manage it until Terraform knows about it through its state.

🔥 One-minute revision
Manual AWS Resource
       ↓
Create matching Terraform resource block
       ↓
terraform import
       ↓
Resource enters Terraform state
       ↓
terraform plan
       ↓
Fix differences between .tf and actual resource
       ↓
No changes
       ↓
Terraform now manages the resource

And the biggest distinction to remember:

Terraform configuration = what you want

Terraform state = what Terraform knows/manages

AWS infrastructure = what actually exists

The purpose of terraform import is to connect an already-existing AWS resource with Terraform's state and configuration.