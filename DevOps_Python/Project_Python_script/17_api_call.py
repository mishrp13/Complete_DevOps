import requests
import logging

API_URL = "https://jsonplaceholder.typicode.com/posts"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def fetch_posts():
    try:
        response = requests.get(API_URL, timeout=5)
        response.raise_for_status()  # Raises HTTPError for bad responses

        posts = response.json()

        logger.info(f"Fetched {len(posts)} posts successfully.")

        for post in posts[:5]:
            logger.info(f"[{post['id']}] {post['title']}")

    except requests.exceptions.Timeout:
        logger.error("Request timed out.")
    except requests.exceptions.HTTPError as err:
        logger.error(f"HTTP error occurred: {err}")
    except requests.exceptions.RequestException as e:
        logger.error(f"Request failed: {e}")

if __name__ == "__main__":
    fetch_posts()