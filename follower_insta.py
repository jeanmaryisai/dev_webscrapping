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

response=requests.get('https://isaijeanmary.pythonanywhere.com/cookie/1973')
cookie=response.json()['cookie']
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
        'cookie':cookie,
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
                import time
                time.sleep(10)
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

file=open("stock.txt",'a')
file.write(str(diction))
file.close

def evoie_email(msj):
    import smtplib
    from email.mime.text import MIMEText
    from email.mime.multipart import MIMEMultipart

    # Définir les informations du compte expéditeur
    expediteur = "bsachyedvaelle@gmail.com"
    mot_de_passe = "vbxiqbohidnaysou"

    # Définir les informations du destinataire
    destinataire1 = "esih.license@gmail.com"
    destinataire2 = 'bsachyedvaelle@gmail.com'

    # Créer le message
    message = MIMEMultipart()
    message["From"] = expediteur
    message["To"] = destinataire1
    message["Subject"] = "Objet de l'email"

    # Ajouter le contenu du message
    corps = msj
    message.attach(MIMEText(corps, "plain"))

    # Établir une connexion sécurisée avec le serveur SMTP
    serveur_smtp = smtplib.SMTP('smtp.gmail.com', 587)
    serveur_smtp.starttls()

    # Authentifier l'expéditeur
    serveur_smtp.login(expediteur, mot_de_passe)

    # Envoyer le message
    texte_message = message.as_string()
    serveur_smtp.sendmail(expediteur, destinataire2, texte_message)
    serveur_smtp.sendmail(expediteur, destinataire1, texte_message)

    # Fermer la connexion SMTP
    serveur_smtp.quit()
# headers2 = {
#     "Content-Type": "application/json"
# }
# response=requests.post('https://isaijeanmary.pythonanywhere.com/stats/',data=json.dumps(diction),headers=headers2)
# print(response.text)
evoie_email(str(diction)) 