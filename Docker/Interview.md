High-level overview (start with this)

In our organization at CitiBank, we use LightSpeed as an enterprise CI/CD orchestration platform. It does not replace tools like GitHub, Tekton, Harness, or OpenShift; instead, it coordinates and governs them to provide standardized, secure, and compliant software delivery across teams.

What LightSpeed does (core responsibility)

You can explain LightSpeed as:

LightSpeed acts as the control plane for CI/CD. It standardizes pipelines, enforces Citi security and compliance policies, manages approvals, and orchestrates the execution of pipelines across multiple tools.

Key responsibilities:

Pipeline orchestration and governance

Enterprise security and compliance enforcement

Standardized CI/CD workflows across teams

Integration with best-of-breed tools (GitHub, Tekton, Harness, OpenShift)

Tool-by-tool integration explanation
1. GitHub – Source Control & Trigger

GitHub is used as the source code repository. Developers push code or raise pull requests in GitHub.

How it integrates:

GitHub webhooks notify LightSpeed when:

Code is pushed

A PR is created or merged

LightSpeed validates:

Branching strategy

PR approvals

Required checks (security scans, code quality)

➡️ GitHub = Code + Triggers

2. Tekton – CI Pipeline Execution

Tekton is used for CI execution — building, testing, and scanning the application.

How it works:

LightSpeed triggers Tekton pipelines

Tekton performs:

Code checkout

Build (e.g., Maven/Gradle/npm)

Unit tests

Static code analysis

Image build

Artifacts and container images are generated

➡️ Tekton = Build & Test Engine

3. Harness – CD & Deployment Strategy

Harness is used for continuous delivery, managing how applications are deployed.

Harness handles:

Deployment strategies:

Blue-Green

Canary

Rolling updates

Environment promotions:

Dev → QA → UAT → Prod

Approval workflows (manual or automated)

Rollbacks in case of failure

LightSpeed:

Orchestrates when Harness is invoked

Ensures compliance gates are passed before deployment

➡️ Harness = Controlled & Safe Deployment

4. OpenShift – Runtime Platform

OpenShift is our Kubernetes-based platform where applications actually run.

OpenShift provides:

Container orchestration

Scaling and self-healing

Security and network policies

Namespace isolation per environment

Harness deploys applications into OpenShift clusters.

➡️ OpenShift = Execution & Runtime Environment

End-to-end CI/CD flow (very important for interviews)

You can say this almost verbatim:

A developer pushes code to GitHub

GitHub triggers LightSpeed

LightSpeed validates governance and starts the pipeline

Tekton runs CI tasks (build, test, scan, image creation)

On success, LightSpeed triggers Harness

Harness deploys the application to OpenShift

OpenShift runs and manages the application in the target environment

Why Citi uses LightSpeed (business angle)

Interviewers love this part.

Citi uses LightSpeed to achieve enterprise-level consistency, security, and compliance across thousands of applications and teams.

Benefits:

Standard CI/CD across the bank

Built-in security and regulatory compliance

Reduced manual errors

Faster, safer releases

Auditability and traceability

One-line summary (great closing statement)

LightSpeed is the CI/CD orchestrator that governs and coordinates GitHub for source control, Tekton for CI, Harness for CD, and OpenShift for runtime deployment in a secure, enterprise-compliant manner.

******
My name is Prabal Mishra, and I am a DevOps Engineer with experience in building scalable and automated infrastructure on AWS Cloud, with strong expertise in Kubernetes,Docker, and CI/CD pipelines.

In my current role at Tata Consultancy Services, I have implemented containerization and Kubernetes-based orchestration that significantly reduced environment-related issues, designed CI/CD pipelines with Jenkins to accelerate deployments, and ensured high availability for production environments. 

I hold a B.E. in Electronics and Communication Engineering from Chandigarh University, and I am passionate about automating infrastructure, improving release velocity, and ensuring reliable cloud-native systems.

I’m excited about this opportunity because I want to bring my expertise in DevOps practices, cloud automation, and production reliability to contribute to your team’s success.”

***
Q1. u have done HPA but only one pod is running how will you troubleshoot?


Step-by-step troubleshooting:

1️⃣ Check HPA status

kubectl get hpa
kubectl describe hpa <hpa-name>


Check target vs current CPU/memory

2️⃣ Verify metrics server

kubectl get pods -n kube-system | grep metrics


If metrics server is not running → HPA won’t scale

3️⃣ Check pod resource requests

kubectl describe pod <pod-name>


👉 HPA requires CPU/memory requests to be set

4️⃣ Check load

kubectl top pods


If actual usage is below threshold → no scaling

5️⃣ Check maxReplicas

kubectl get hpa <hpa-name> -o yaml


Ensure maxReplicas > 1

Interview-ready answer:

“I check HPA metrics, metrics server, resource requests, and actual load. Most commonly it’s missing CPU requests or metrics server issues.”

Q2. ur pod is crashloop back state how will you troubleshoot?

1️⃣ Check pod status

kubectl describe pod <pod-name>


2️⃣ Check logs

kubectl logs <pod-name>
kubectl logs <pod-name> --previous


3️⃣ Check container command & args

kubectl get pod <pod-name> -o yaml


4️⃣ Check config & secrets

Missing ENV variables

Wrong config map

Secret not mounted

5️⃣ Check resource limits

OOMKilled?

kubectl describe pod | grep -i oom

Interview-ready answer:

“CrashLoopBackOff usually means app startup failure, wrong configs, missing secrets, or OOM issues. Logs are the first thing I check.”

Q3. ur pod is in pending state how will you troubleshoot?
1️⃣ Describe the pod

kubectl describe pod <pod-name>


2️⃣ Check node availability

kubectl get nodes


3️⃣ Check resource requests

CPU/memory too high?

No node can schedule it

4️⃣ Check PVC

kubectl get pvc


Pending PVC → pod stays pending

5️⃣ Check taints & tolerations

kubectl describe node <node-name>

Interview-ready answer:

“Pending state is mostly scheduling issues—insufficient resources, PVC pending, or taints without tolerations.”

Q4. ur build is success and showing green but deployment is failing?
1️⃣ Check deployment events

kubectl describe deployment <deployment-name>


2️⃣ Check pod status

kubectl get pods


3️⃣ Check image pull

kubectl describe pod <pod>


ImagePullBackOff?

Wrong image tag?

4️⃣ Check environment

ConfigMaps

Secrets

Wrong environment variables

5️⃣ Check readiness probes

Pod running but not ready

Interview-ready answer:

“Build success only means image creation. Deployment can fail due to wrong image tags, missing configs, secrets, or probe failures.”
Q5. if your etcd is down does it impact?

Short answer:

👉 YES – major impact

What happens:

Kubernetes state is stored in etcd

API server cannot read/write cluster state

No new pods, deployments, or scaling

Running pods continue but no changes possible

Interview-ready answer:

“If etcd is down, the control plane is effectively read-only. Existing workloads run, but cluster changes fail.”

Q6. where u will define the disk of the node in k8s cluster?
👉 Kubernetes does NOT manage node disks directly

Disk is defined at:

Bare-metal → OS level (LVM, mount points)

VMware → VM disk configuration

Cloud/OpenStack → volume attached to VM

In Kubernetes you define:

PersistentVolume (PV)

PersistentVolumeClaim (PVC)

apiVersion: v1
kind: PersistentVolume
spec:
  capacity:
    storage: 10Gi

Interview-ready answer:

“Node disks are configured at infrastructure/OS level. Kubernetes consumes storage using PVs and PVCs, not by defining node disks.”

🧠 One-Line Killer Answers (Memorize)
Scenario	One-liner
HPA not scaling	Metrics or resource requests missing
CrashLoopBackOff	App startup/config/resource issue
Pod Pending	Scheduling or storage problem
Build green, deploy fail	Runtime config/image/probe issue
etcd down	Control plane frozen
Node disk	Infra-level, not Kubernetes
