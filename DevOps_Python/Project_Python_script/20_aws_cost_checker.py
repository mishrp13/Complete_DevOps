import boto3
from datetime import datetime, timedelta


def fetch_aws_cost():
    """Fetch AWS cost for current month"""

    client = boto3.client("ce")  # CE = Cost Explorer

    today = datetime.today()
    start = today.replace(day=1).strftime("%Y-%m-%d")
    end = today.strftime("%Y-%m-%d")

    response = client.get_cost_and_usage(
        TimePeriod={
            "Start": start,
            "End": end
        },
        Granularity="MONTHLY",
        Metrics=["UnblendedCost"]
    )

    amount = response["ResultsByTime"][0]["Total"]["UnblendedCost"]["Amount"]
    return float(amount)


def main():
    print("📊 Fetching AWS Cost Data...")

    cost = fetch_aws_cost()

    print("----------------------------")
    print(f"Current Month AWS Cost: ${cost:.2f}")

    if cost > 300:
        print("⚠️ Alert: High AWS usage detected!")
    else:
        print("✅ AWS spending is within limits.")


if __name__ == "__main__":
    main()