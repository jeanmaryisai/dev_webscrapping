from pprint import pprint
import requests
import json
import random
import time
usernames = ['rutshelle','darlinedesca', 'vanessa_desireofficiel', 'fatiful', 'aniealerte']
proxy_url = "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks4.txt"
content = requests.get(proxy_url)
proxyList = content.text.strip().split('\n')
proxyList = list(map(lambda x:x.strip(), proxyList))

def get_headers(username):
    headers = {
        'authority': "www.instagram.com",
        'method': 'GET',
        "path": f"/api/v1/users/web_profile_info/?username={username}",
        'scheme': 'https',
        'accept': '/',
        'accept-encoding': 'gzip, deflate, br',
        'accept-language': 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7',
        'cookie': 'ig_did=50970B29-E318-4BE6-BFB1-849430CAEE98; ig_nrcb=1; mid=ZDoDZAALAAGd7QIw6S6Vkv7paSdg; dpr=1.25; datr=rwE6ZHdeGG4RoaT5lEbj_rys; shbid=\"15689\0542104076246\0541713069555:01f7eaa3ed6e8b56b91b3bb3703e3ac2b1e7589c8e804c2b1b0f30879c6353a215a80d15"; shbts="1681533555\0542104076246\0541713069555:01f718b79c864ddb8d46a1a07e94281ec13b8e513bb1449f97cd57d8c42be5b81b79aab2"; csrftoken=DPIJD2BD5vQQgZskYqjweLFK4wA7B9bs; ds_user_id=59102079387; sessionid=59102079387%3AFNaXoPOAxUjCox%3A19%3AAYcQiLOCs31uV-OuqXZpfzfKyrxc1Qt_sBBCmPLBKw; rur=\"NCG\05459102079387\0541713144867:01f725120d8c26c0d62d83549687cda15a6d53122873907d9a30b04f145b657542714fee"',
        'referer': f'https://www.instagram.com/{username}/',
        'sec-ch-prefers-color-scheme': 'dark',
        'sec-ch-ua': '"Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform':"Windows",
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode':'cors',
        'sec-fetch-site':'same-origin',
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',
        'viewport-width':'795',
        'x-asbd-id': '198387',
        'x-csrftoken': 'DPIJD2BD5vQQgZskYqjweLFK4wA7B9bs',
        'x-ig-app-id': '936619743392459',
        'x-ig-www-claim': 'hmac.AR2lemw5HHyIjbLAGWSLif8Ak8rvlLO0YKvItJMB7R2oP_r-',
        'x-requested-with': 'XMLHttpRequest'
    }
    return headers

def parse_data(user_data):
    output = {}
    user_data = user_data
    output['name'] = user_data['full_name']
    output['followers'] = user_data['edge_followed_by']['count']
    return output

def main():
    output = {}
    for username in usernames:
        insta_url = f"https://www.instagram.com/api/v1/users/web_profile_info/?username={username}"
        random_proxy = random.choice(proxyList)
        response = requests.get(insta_url, headers=get_headers(username), proxies={'http': random_proxy})

        if response.status_code == 200:
            try:
                print("get", username)
                # resp_json = json.loads(response.text)
                response_json = response.json()['data']['user']['edge_followed_by']['count']
                output[username] = response_json
            except:
                print(f"Failed to parse data for {username}. The response isn't JSON.")
        elif response.status_code == 301 or response.status_code == 302:
            print(f"Failed for {username}. Redirect to login.")
        else:
            print(f"Request failed for {username}. Status: {response.status_code}")
        
        # Add a delay of 10 seconds between requests
        time.sleep(10)

    follower_count = output
    pprint(follower_count)


if __name__ == 'main':
    main()














# import requests, json, random
# from pprint import pprint

# def get_proxy():
#     proxy_url = "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks5.txt"

#     #Get proxy content as string
#     content = requests.get(proxy_url)

#     #Remove leading and trailing whitespaces and split the text
#     proxyList = content.text.strip().split('\n')
#     proxyList = list(map(lambda x: x.strip(), proxyList))


#     proxy = None
#     trial = 30

#     while trial > 0:
#         #Get a random proxy
#         proxy = random.choice(proxyList)

#         try:
#             test = requests.get("https://google.com", proxies = {"http": proxy}, timeout=3)
#             if test.status_code == 200:
#                 print('Proxy found')
#                 return proxy
#         except Exception as error:
#             print("Error:", error)
        
#         trial -= 1

# usernames = ["jlo", "shakira", "beyonce", "katyperry"]
# proxy = get_proxy()
# output = {}
# def get_headers(username):
#     headers = {
#         "authority": "www.instagram.com",
#         "method": "GET",
#         "path": "/{0}/".format(username),
#         "scheme": "https",
#         "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
#         "accept-encoding" : "gzip, deflate, br",
#         "accept-language": "en-GB,en-US;q=0.9,en;q=0.8",
#         "upgrade-insecure-requests": "1",
#         "Connection": "close",
#         "user-agent" : random.choice([
#               "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36",
#               "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36",
#               "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36",
#               "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36"
#             ])
#     }
#     return headers
# def parse_data(username, user_data):
#     captions = []
#     if len(user_data['edge_owner_to_timeline_media']['edges']) > 0:
#         for node in user_data['edge_owner_to_timeline_media']['edges']:
#             if len(node['node']['edge_media_to_caption']['edges']) > 0:
#                 if node['node']['edge_media_to_caption']['edges'][0]['node']['text']:
#                     captions.append(
#                         node['node']['edge_media_to_caption']['edges'][0]['node']['text']
#                     )
#     output[username] = {
#         'name': user_data['full_name'],
#         'category': user_data['category_name'],
#         'followers': user_data['edge_followed_by']['count'],
#         'posts': captions,
#     }
    
# def main():
#     for username in usernames:
#         url = f"https://instagram.com/{username}/?__a=1&__d=dis"    
#         response = requests.get(url, headers=get_headers(username), proxies = {'http': proxy, 'https': proxy})
#         if response.status_code == 200:
#             try:
#                 resp_json = json.loads(response.text)
#             except:
#                 print ("Failed. Response not JSON")
#                 continue
#             else:
#                 user_data = resp_json['graphql']['user']
#                 parse_data(username, user_data)
#         elif response.status_code == 301 or response.status_code == 302:
#             print ("Failed. Redirected to login")
#         else:
#             print("Request failed. Status: " + str(response.status_code))
# if __name__ == '__main__':
#     main()
#     pprint(output)






# ============================================================================ Fabrice ==================================================

# import requests
# import random
# import re
# import json
# import datetime
# from time import strftime
# from bs4 import BeautifulSoup as bs

# # user list
# userList=['rutshelle','darlinedesca','vanessa_desireofficiel','fatiful','aniealerte','tafaayiti','bedjineofficiel','blondedyferdinandshop']

# # my target(wich is the API for loading the data)
# target="https://www.instagram.com/api/v1/users/web_profile_info/?username="


# # get a list of working proxies
# proxy_url="https://raw.githubusercontent.com/TheSpeedx/PROXY-List/master/socks4.txt"


# # get the proxy content as string
# res=requests.get(proxy_url)

# # remove spaces around and split it by breakline
# proxyLIst= res.text.strip().split("\n")

# # initialise the list we need
# date=datetime.datetime.now()
# user=''
# followers=''

# diction=[{'date':date.strftime('%A, %d %B %Y')}]

# # scrapping for every user
# for us in userList:
#     # getting the instagram's header to simulate a navigator
#     header={
# 'authority':'ww.instagram.com',
# 'method': 'GET',
# 'path': f'/api/v1/users/web_profile_info/?username={us}',
# 'scheme': 'https',
# 'accept': '*/*',
# 'accept-encoding': 'gzip, deflate, br',
# 'accept-language': 'fr-FR,fr;q=0.9,en-US;q=0.8,en-JM;q=0.7,en;q=0.6',
# 'referer': f'https://www.instagram.com/{us}/',
# 'sec-ch-prefers-color-scheme': 'light',
# 'sec-ch-ua':'"Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"',
# 'sec-ch-ua-mobile': '?0',
# 'sec-ch-ua-platform': "Windows",
# 'sec-fetch-dest': 'empty',
# 'sec-fetch-mode': 'cors',
# 'sec-fetch-site': 'same-origin',
# 'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',
# 'viewport-width': '982',
# 'x-asbd-id': '198387',
# 'x-csrftoken': 'SKrByq6k5muGwjlkEpDvoIHLOHeJwi8Q',
# 'x-ig-app-id': '936619743392459',
# 'x-ig-www-claim': '0',
# 'x-requested-with': 'XMLHttpRequest'
#     }




#     tries=len(proxyLIst)
#     while tries>0:
#         # find a random proxy
#         proxy=random.choice(proxyLIst)

# # test if it works
#         try:
#             response=requests.get(target+str(us),headers=header,proxies={"http":proxy},timeout=3)
#             if res.status_code == 200:
#                 print("Proxy found: ",proxy)
#                 # contenu=json.loads(response)
#                 # followers=contenu['data']['user']['edge_followed_by']['count']
#                 # user=contenu['data']['user']['full_name']
#                 soup = bs(response.content,'html.parser')
#                 cards= soup.find_all('h1')
#                 print(soup)

#                 break
#         except Exception as error:
#             print("Error: ",error)

#         tries -=1
#         # adding the data we collect to the list
#     diction.append({'user':user,'followers':followers})


# # print the result
# print(diction)



