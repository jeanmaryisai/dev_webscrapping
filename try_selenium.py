import requests, json, random,time
from pprint import pprint
usernames = ['rutshelle','darlinedesca','vanessa_desireofficiel','fatiful','aniealerte','tafaayiti','bedjineofficiel','blondedyferdinandshop']
proxy = "http://username:password@proxy:port"
output = {}
proxy_url = "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks4.txt"
content = requests.get(proxy_url)
proxyList = content.text.strip().split('\n')
proxyList = list(map(lambda x:x.strip(), proxyList))
def get_headers(username):
    headers = {
        "authority": "www.instagram.com",
        "method": "GET",
        "path": "/{0}/".format(username),
        "scheme": "https",
        "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "accept-encoding" : "gzip, deflate, br",
        "accept-language": "en-GB,en-US;q=0.9,en;q=0.8",
        "upgrade-insecure-requests": "1",
        "Connection": "close",
        "user-agent" : random.choice([
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.80 Safari/537.36", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36",
              "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36",
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36",
              "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36"
            ])
    }
    return headers
def parse_data(username, user_data):
    output[username] =  user_data['edge_followed_by']['count']
      
    
    
def main():
    for username in usernames:
        url = f"https://instagram.com/{username}/?__a=1&__d=dis"
        random_proxy = random.choice(proxyList)    
        response = requests.get(url, headers=get_headers(username), proxies = {'http': random_proxy})
        if response.status_code == 200:
            try:
                resp_json = json.loads(response.text)
            except:
                print ("Failed. Response not JSON")
                continue
            else:
                user_data = resp_json['graphql']['user']
                parse_data(username, user_data)
                print(f'Successfully get {username}')
        elif response.status_code == 301 or response.status_code == 302:
            print ("Failed. Redirected to login")
        else:
            print("Request failed. Status: " + str(response.status_code))
    time.sleep(10)
    
if __name__ == '__main__':
    main()
    from datetime import datetime
    date=datetime.today().strftime('%Y-%m-%d')
    output['date']=date
    pprint(output)

    headers2 = {
    "Content-Type": "application/json"
}
    response=requests.post('https://isaijeanmary.pythonanywhere.com/stats/',data=json.dumps(output),headers=headers2)
    print(response.text)