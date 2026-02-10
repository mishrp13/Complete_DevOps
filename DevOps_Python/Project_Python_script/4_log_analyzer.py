#!/usr/bin/env python3

# Day 4 – Log File Analyzer

# Task

# Read a log file

# Count ERROR / WARNING lines

# Skills

# File handling


def analyze_log_file(file_path):
    error_count = 0
    warning_count = 0

    try:
        with open(file_path, "r") as log_file:
            for line in log_file:
                if "ERROR" in line:
                    error_count += 1
                elif "WARNING" in line:
                    warning_count += 1

        print("Log Analysis Result")
        print("-------------------")
        print(f"ERROR count   : {error_count}")
        print(f"WARNING count : {warning_count}")

    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found.")
    except PermissionError:
        print(f"Error: Permission denied for '{file_path}'.")
    except Exception as e:
        print(f"Unexpected error: {e}")


if __name__ == "__main__":
    log_file_path = "application.log"  # change this to your log file name
    analyze_log_file(log_file_path)
