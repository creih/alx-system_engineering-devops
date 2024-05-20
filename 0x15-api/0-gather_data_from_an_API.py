#!/usr/bin/python3
"""
task 0 iri kuri 0x15-API iri ku displayinga employe na tasks yakoze
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
    tods = tods_r.json()
    rangiye = []
    for tod in tods:
        if tod.get("completed") is True:
            rangiye.append(tod.get("title"))
    print("Employee {} is done with tasks({}/{}):".format(usr.get("name"), len(rangiye), len(tod)))
    for rangiy in rangiye:
        print("\t {}".format(rangiy))
