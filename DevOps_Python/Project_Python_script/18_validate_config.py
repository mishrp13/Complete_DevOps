import os
import sys
import json
import yaml

CONFIG_DIR = "configs"
REQUIRED_KEYS = ["app_name", "version", "environment"]


def validate_json(file_path):
    try:
        with open(file_path, "r") as f:
            data = json.load(f)
        print(f"✔ Valid JSON: {file_path}")
        return data
    except Exception as e:
        print(f"✖ Invalid JSON: {file_path}")
        print(f"  Error: {e}")
        return None


def validate_yaml(file_path):
    try:
        with open(file_path, "r") as f:
            data = yaml.safe_load(f)
        print(f"✔ Valid YAML: {file_path}")
        return data
    except Exception as e:
        print(f"✖ Invalid YAML: {file_path}")
        print(f"  Error: {e}")
        return None


def check_required_keys(data, file_path):
    missing_keys = [key for key in REQUIRED_KEYS if key not in data]

    if missing_keys:
        print(f"✖ Missing keys in {file_path}: {missing_keys}")
        return False

    print(f"✔ Required keys present in {file_path}")
    return True


def main():
    if not os.path.exists(CONFIG_DIR):
        print("Config directory not found!")
        sys.exit(1)

    all_valid = True

    for filename in os.listdir(CONFIG_DIR):
        file_path = os.path.join(CONFIG_DIR, filename)

        if filename.endswith(".json"):
            data = validate_json(file_path)
        elif filename.endswith((".yaml", ".yml")):
            data = validate_yaml(file_path)
        else:
            continue

        if data is None:
            all_valid = False
            continue

        if not check_required_keys(data, file_path):
            all_valid = False

    if not all_valid:
        print("\n❌ Validation failed. Stopping deployment.")
        sys.exit(1)

    print("\n✅ All configuration files are valid. Ready for deployment!")
    sys.exit(0)


if __name__ == "__main__":
    main()