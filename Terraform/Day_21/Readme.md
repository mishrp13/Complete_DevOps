### Project: AWS Policy and Governance using Terraform

I worked on an AWS Policy and Governance project where the main goal was to **automate security, governance, and compliance using Terraform**.

The idea behind the project was to make sure that AWS resources follow security best practices and that configuration changes can be continuously monitored instead of relying on manual checks.

I divided the implementation into three major areas: **IAM security, S3 security, and AWS Config compliance monitoring**.

**First, IAM:**
I created IAM policies using Terraform for different security requirements. For example, I implemented a policy to require MFA for sensitive S3 operations, a policy to enforce secure HTTPS communication with S3, and a tagging policy to ensure resources have required tags such as Environment and Owner.

**Second, S3 security:**
I created an S3 bucket that was configured with **server-side encryption, versioning, public access blocking, and secure transport**. This provided multiple layers of protection for the bucket and also helped maintain an audit trail through versioning.

**Third, AWS Config:**
I configured AWS Config to continuously monitor the AWS environment. I created compliance rules for things like S3 public access, S3 encryption, EBS volume encryption, required resource tags, IAM password policy, and root account MFA.

So, if someone changes a resource configuration and it violates one of these rules, **AWS Config can detect the violation and report the compliance status**.

The entire setup was implemented using **Terraform**, which means the infrastructure and security policies are defined as code. This makes the environment repeatable, version-controlled, and easier to maintain across different environments.

### Architecture

The overall flow was:

**Terraform → IAM/S3/AWS Config → Continuous Compliance Monitoring**

Terraform provisions the required resources and policies, while AWS Config continuously evaluates the environment against the defined compliance rules.

### Security approach

The project follows a **defense-in-depth approach**:

* IAM controls who can perform actions.
* S3 policies and public access blocking protect the data.
* Encryption protects data at rest.
* HTTPS protects data in transit.
* Versioning helps with recovery and auditing.
* AWS Config continuously monitors compliance.
* Resource tagging helps with governance and cost management.

### Key takeaway

The main thing I learned from this project is that **cloud security should not depend only on manual processes**. With Terraform and AWS Config, security policies and compliance requirements can be defined as code, deployed consistently, and continuously monitored.

This project gave me practical experience with **Terraform, IAM, S3 security, AWS Config, policy-as-code, compliance monitoring, and cloud governance**.
