import sys
import subprocess


def check_kubectl_auth():
    """Check if kubectl is authenticated and cluster is reachable"""
    try:
        result = subprocess.run(
            ["kubectl", "cluster-info"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        print("✅ kubectl authentication successful.")
    except subprocess.CalledProcessError:
        print("❌ kubectl is not authenticated or cluster is unreachable.")
        sys.exit(1)


def restart_pod(pod_name, namespace):
    """Delete pod so it gets recreated"""
    try:
        subprocess.run(
            ["kubectl", "delete", "pod", pod_name, "-n", namespace],
            check=True
        )
        print(f"🔄 Pod '{pod_name}' deleted successfully.")
        print("Kubernetes will recreate it automatically (if managed by Deployment).")
    except subprocess.CalledProcessError:
        print(f"❌ Failed to delete pod '{pod_name}'.")
        sys.exit(1)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python restart_pod.py <pod_name> <namespace>")
        sys.exit(1)

    pod_name = sys.argv[1]
    namespace = sys.argv[2]

    check_kubectl_auth()
    restart_pod(pod_name, namespace)
