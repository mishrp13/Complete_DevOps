import subprocess

service_name=input("Enter the service name: ")

def check_service(service):
    try:
        subprocess.check_output(
            ["systemctl","is-active","--quiet",service]
        )
    except subprocess.CalledProcessError:
        return False
    
def restart_service(service):
    try:
        subprocess.check_output(
            ["sudo","systemct","restart",service]
        )
    except subprocess.CalledProcessError:
        return False
    
if check_service(service_name):
    print(f"service '{service_name}' is running")
else:
    print(f"service '{service_name}' is not running")
    print(f"service '{service_name}' is restarting")

    if restart_service(service_name):
        if check_service(service_name):
            print(f"service '{service_name}' is running")
        else:
            print(f"service '{service_name}' restarted but not running")
    else:
        print(f"service '{service_name}' failed to restart")