import sys
import json

try:
    import yaml
except ImportError:
    yaml = None


def load_file(filename):
    try:
        if filename.endswith(".json"):
            with open(filename, "r") as f:
                return json.load(f)

        elif filename.endswith((".yml", ".yaml")):
            if yaml is None:
                raise ImportError("PyYAML not installed")

            with open(filename, "r") as f:
                return yaml.safe_load(f)

        else:
            raise ValueError("Unsupported file type")

    except FileNotFoundError:
        print(f"❌ File not found: {filename}")
        sys.exit(1)

    except json.JSONDecodeError:
        print(f"❌ Invalid JSON format in {filename}")
        sys.exit(1)

    except yaml.YAMLError:
        print(f"❌ Invalid YAML format in {filename}")
        sys.exit(1)

    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        sys.exit(1)


def print_config(config):
    try:
        for key, value in config.items():
            print(f"{key}: {value}")
    except AttributeError:
        print("❌ Config data is not a dictionary")
        sys.exit(1)


# ---------- MAIN ----------
try:
    if len(sys.argv) != 2:
        raise ValueError("Usage: python config.py <config.yaml|config.json>")

    config_file = sys.argv[1]
    config_data = load_file(config_file)
    print_config(config_data)

except ValueError as e:
    print(f"❌ {e}")
    sys.exit(1)
