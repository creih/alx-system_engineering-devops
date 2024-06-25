#!/usr/bin/python3
"""this module is for reddit APIs usage"""
import requests # type: ignore


def number_of_subscribers(subreddit):
    """ tasks' function as requested in the task."""
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {'User-Agent': 'my-app'}

    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        if response.status_code == 200:
            data = response.json()
            return data['data']['subscribers']
        else:
            return 0
    except requests.RequestException:
        return 0

if __name__ == "__main__":
    subreddit = "python"  # You can replace this with any subreddit name
    print(f"Subscribers: {number_of_subscribers(subreddit)}")
