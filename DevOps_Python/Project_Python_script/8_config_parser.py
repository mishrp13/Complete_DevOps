import json
import yaml
import sys
import os

def load_config(file_path):
    if not os.path.exists(file_path):
        print(f"❌ Config file not found: {file_path}")
        sys.exit(1)

    try:
        if file_path.endswith(".json"):
            with open(file_path, "r") as file:
                return json.load(file)

        elif file_path.endswith((".yaml", ".yml")):
            with open(file_path, "r") as file:
                return yaml.safe_load(file)

        else:
            print("❌ Unsupported file format. Use JSON or YAML.")
            sys.exit(1)

    except Exception as e:
        print(f"❌ Failed to read config file: {e}")
        sys.exit(1)

def print_config(config):
    print("\n✅ Loaded Configuration:")
    print("------------------------")
    for key, value in config.items():
        print(f"{key}: {value}")

# -------- MAIN --------
if len(sys.argv) != 2:
    print("Usage: python config_parser.py <config_file.json|yaml>")
    sys.exit(1)

config_file = sys.argv[1]
config_data = load_config(config_file)
print_config(config_data)
