import subprocess
import datetime

def send_alert(message):
    # Mock Slack alert
    print("\n🚨 ALERT 🚨")
    print(f"Time: {datetime.datetime.now()}")
    print(f"Message: {message}")
    print("Sending alert to Slack channel #devops-alerts...\n")


def check_service():
    try:
        result = subprocess.run(
            ["kubectl", "get", "pods"],
            capture_output=True,
            text=True,
            check=True
        )

        if "CrashLoopBackOff" in result.stdout or "Error" in result.stdout:
            send_alert("Pod failure detected in Kubernetes cluster!")

        else:
            print("✅ Cluster healthy. No failures detected.")

    except Exception as e:
        send_alert(f"Script failed: {e}")


if __name__ == "__main__":
    check_service()