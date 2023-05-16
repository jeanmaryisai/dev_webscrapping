import requests
import random
import re
import json
import datetime
import time
from time import strftime

# user list
userList=['rutshelle','darlinedesca','vanessa_desireofficiel','fatiful','aniealerte','tafaayiti','bedjineofficiel','blondedyferdinandshop']
prof='esih.license@gmail.com'
# prof= 'jeanmaryisai@gmail.com'
target="https://www.instagram.com/"


# get a list of working proxies
proxy_url="https://raw.githubusercontent.com/TheSpeedx/PROXY-List/master/socks4.txt"

# define send mail function
def send_mail(msj,to,smtp_username = 'isaitest334@gmail.com',smtp_password = 'mgotweqrwrtmvsfo',subject= 'Isai Jean Mary daily report of instagram followers. '):
    import smtplib
    from email.mime.text import MIMEText
    from email.mime.multipart import MIMEMultipart
    from email.mime.image import MIMEImage

    # Paramètres SMTP de Gmail
    smtp_server = 'smtp.gmail.com'
    smtp_port = 587

    # Création du message
    msg = MIMEMultipart()
    msg['From'] = smtp_username
    msg['To'] = to
    msg['Subject'] = 'Isai Jean Mary daily report of instagram followers. '

    # Ajout du contenu du message
    body = msj
    msg.attach(MIMEText(body, 'html'))

    # Envoi du message
    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()
        server.login(smtp_username, smtp_password)
        server.sendmail(smtp_username, to, msg.as_string())

# get the proxy content as string
res=requests.get(proxy_url)

# remove spaces around and split it by breakline
proxyLIst= res.text.strip().split("\n")

# initialise the list we need
date=datetime.datetime.now()
user=''
followers=''

diction={'date':date.strftime('%Y-%m-%d')}
# cookie=1
# try:
#     response=requests.get('https://isaijeanmary.pythonanywhere.com/cookie/fdsddfaoiuhfda')
#     cookie=response.json()['cookie']
# except:
#     send_mail('Desole nous n\'avons pas faire la requete car les cookies sont expirées',prof)
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
        # 'cookie':cookie,
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
            import time
            time.sleep(10)
            if resp.status_code == 200:
                print('Retriving data from',resp.url)
                contenu=resp.json()

                followers=contenu['graphql']['user']['edge_followed_by']['count']
                user=contenu['graphql']['user']['full_name']
                if contenu =='':
                    send_mail('Desole nous n\'avons pas faire la requete car les cookies sont expirées ou invalides',prof)
                    send_mail('Desole nous n\'avons pas faire la requete car les cookies sont expirées ou invalides','jeanmaryisai@gmail.com')
                break
        except Exception as error:
            print("Error: **",error,"**\n")
            send_mail(error,prof)
            send_mail(error,'jeanmaryisai@gmail.com')


    # adding the data we collect to the list
    diction[us]=followers


# print the result
print(diction)
headers2 = {
    "Content-Type": "application/json"
}
response=requests.post('https://isaijeanmary.pythonanywhere.com/stats/',data=json.dumps(diction),headers=headers2)
print(response.text)
send_mail(response.text,'jeanmaryisai@gmail.com')
send_mail(response.text,prof)
print('fini')
