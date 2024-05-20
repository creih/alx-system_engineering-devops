#!/usr/bin/python3
"""
this module is for task 0 in 0x15-API project and is displaying
a user name and a set of completed tasks.
"""
import requests
import sys


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    em_id = sys.argv[1]
    usr_r = requests.get(url + "users/{}".format(em_id))
    usr = usr_r.json()
    par = {"userId": em_id}
    tods_r = requests.get(url + "todos", params=par)
    tod = tods_r.json()
    izarangiye = []
    for tos in tod:
        if tos.get("completed") is True:
            izarangiye.append(tos.get("title"))
    print("Employee {} is done with tasks ({}/{})".format(
        usr.get("name"),
        len(izarangiye),
        len(tod)
    ))
    for combo in izarangiye:
        print("\t {}".format(combo))
