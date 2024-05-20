#!/usr/bin/python3
"""
task 0 iri kuri 0x15-API iri ku displayinga employe na tasks yakoze
"""
import requests
import sys


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 script.py <employee_id>")
        sys.exit(1)

    employee_id = sys.argv[1]
    url = "https://jsonplaceholder.typicode.com/"

    user_response = requests.get(f"{url}users/{employee_id}")
    if user_response.status_code != 200:
        print("Employee not found.")
        sys.exit(1)

    user = user_response.json()
    employee_name = user.get("name")

    todos_response = requests.get(f"{url}todos", params={"userId": employee_id})
    if todos_response.status_code != 200:
        print("Error fetching TODO list.")
        sys.exit(1)

    todos = todos_response.json()
    completed_tasks = [todo["title"] for todo in todos if todo["completed"]]
    total_tasks = len(todos)
    number_of_completed_tasks = len(completed_tasks)

    print(f"Employee {employee_name} is done with tasks({number_of_completed_tasks}/{total_tasks}):")
    for title in completed_tasks:
        print(f"\t {title}")
