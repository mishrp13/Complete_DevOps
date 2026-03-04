import subprocess
import sys


def get_current_branch():
    """Get the current git branch name"""
    try:
        branch = subprocess.check_output(
            ["git", "rev-parse", "--abbrev-ref", "HEAD"]
        ).decode("utf-8").strip()
        return branch
    except subprocess.CalledProcessError:
        print("❌ Not a git repository or git not installed.")
        sys.exit(1)


def is_approved():
    """Check if approval flag is passed"""
    return "--approved" in sys.argv


def main():
    branch = get_current_branch()
    print(f"🔍 Current branch: {branch}")

    if branch == "main":
        if not is_approved():
            print("🚫 Deployment from 'main' branch requires approval!")
            print("👉 Use: python deploy_check.py --approved")
            sys.exit(1)
        else:
            print("✅ Approved deployment from main branch.")
    else:
        print("✅ Safe to deploy from non-main branch.")

    print("🚀 Proceeding with deployment...")


if __name__ == "__main__":
    main()


#  git → Git command

# rev-parse → Git internal command

# --abbrev-ref → Show short branch name

# HEAD → Current checked-out branch