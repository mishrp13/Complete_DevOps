import subprocess

# Take service name from user
service_name = input("Enter the service name to check (example: nginx, ssh): ")

def check_service(service):
    try:
        subprocess.check_output(
            ["systemctl", "is-active", "--quiet", service]
        )
        return True
    except subprocess.CalledProcessError:
        return False

def restart_service(service):
    try:
        subprocess.check_output(
            ["sudo", "systemctl", "restart", service]
        )
        return True
    except subprocess.CalledProcessError:
        return False

# Main logic
if check_service(service_name):
    print(f"✅ Service '{service_name}' is running.")
else:
    print(f"❌ Service '{service_name}' is NOT running.")
    print(f"🔄 Restarting service '{service_name}'...")

    if restart_service(service_name):
        if check_service(service_name):
            print(f"✅ Service '{service_name}' restarted successfully.")
        else:
            print(f"⚠️ Service '{service_name}' restarted but is still NOT running.")
    else:
        print(f"❌ Failed to restart service '{service_name}'.")
