def analyze_log_file(file_path):
    error_count=0
    warning_count=0

    try:
        with open(file_path,"r") as log_file:
            for line in log_file:
                if "ERROR" in line:
                    error_count +=1
                elif "Warning" in line:
                    warning_count +=1
                

        print("Analysing the file")
        print("_____________")
        print(f" warning count: {warning_count}")
        print(f" Error Count: {error_count}")

    except FileNotFoundError:
        print(f" file: {file_path} not found")
    except PermissionError:
        print(f" Permission denied for: {file_path} ")
    except Exception as e:
        print(f"Unexpected Error: {e} ")


if __name__=="__main__":
    log_file_path="application.log"
    analyze_log_file(log_file_path)
