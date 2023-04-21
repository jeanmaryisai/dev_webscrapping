import requests
import random
import re
import json
import datetime
from time import strftime

# user list
userList=['rutshelle','darlinedesca','vanessa_desireofficiel','fatiful','aniealerte','tafaayiti','bedjineofficiel','blondedyferdinandshop']

# my target(wich is the API for loading the data)
target="https://www.instagram.com/"


# get a list of working proxies
proxy_url="https://raw.githubusercontent.com/TheSpeedx/PROXY-List/master/socks4.txt"


# get the proxy content as string
res=requests.get(proxy_url)

# remove spaces around and split it by breakline
proxyLIst= res.text.strip().split("\n")

# initialise the list we need
date=datetime.datetime.now()
user=''
followers=''

diction={'date':date.strftime('%Y-%m-%d')}


# scrapping for every user
for us in userList:
    # getting the instagram's header to simulate a navigator
    header={
        'authority':'ww.instagram.com',
        'method': 'GET',
        'path': f'/api/v1/users/web_profile_info/?username={us}',
        'scheme': 'https',
        'Accept': '*/*',
        'accept-encoding': 'gzip, deflate, br',
        'accept-language': 'fr-FR,fr;q=0.9,en-US;q=0.8,en-JM;q=0.7,en;q=0.6',
        'cookie':'dpr=2.0000000596046448; ig_nrcb=1; mid=ZEFfsgAAAAFC5L7zPAyU17W_mP6K; ig_did=BA490F07-772A-4B71-8B88-C513244A6D99; csrftoken=kXzxlIceC599RNgnmTacI07sdlUaC03r; ds_user_id=59306155021; datr=smxBZK_VWVERKwd44aU8avvw; sessionid=59306155021%3AilVrA8tvqMkJ6K%3A24%3AAYeCegQacxXUIIyhDharUiHqmWt35wtW-PAw2uUB6g; rur=\"VLL\05459306155021\0541713551975:01f7585fb95ade5f70332f109b8cd621c4f7e1e54efe3b99b32c90038796d4a9c124c48a\"',
        'referer': f'https://www.instagram.com/{us}/?hl=fr',
        'sec-ch-prefers-color-scheme': 'light',
        'sec-ch-ua':'"Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': "\"Windows\"",
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-origin',
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',
        'viewport-width': '982',
        'x-asbd-id': '198387',
        'x-ig-app-id': '936619743392459',
        'x-requested-with': 'XMLHttpRequest'
    }




    tries=5
    while tries>0:
        # find a random proxy
        proxy=random.choice(proxyLIst)

# test if it works
        try:
            resp=requests.get(target+us+'/?__a=1&__d=dis',headers=header,proxies={"http":proxy})
            if resp.status_code == 200:
                print("Proxy found:",proxy)
                print(resp.url)
                contenu=resp.json()

                followers=contenu['graphql']['user']['edge_followed_by']['count']
                user=contenu['graphql']['user']['full_name']
                break
        except Exception as error:
            print("Error: **",error,"**\n")

        tries -=1
        # adding the data we collect to the list
    diction[us]=followers


# print the result
print(diction)
headers2 = {
    "Content-Type": "application/json"
}
response=requests.post('https://isaijeanmary.pythonanywhere.com/stats/',data=json.dumps(diction),headers=headers2)
print(response.text)
