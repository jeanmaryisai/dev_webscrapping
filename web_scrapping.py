import requests
import random
from bs4 import BeautifulSoup as bs
numberPage=1


#  isai Jean Mary b+


target = f'https://shield.pythonanywhere.com/?page={numberPage}'

proxy_url = "https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks5.txt"

#Get proxy content as string
content = requests.get(proxy_url)

#Remove leading and trailing whitespaces and split the text
proxyList = content.text.strip().split('\n')
proxyList = list(map(lambda x: x.strip(), proxyList))


proxy = None
trial = 10
counter=1
listproducts=[]
while trial > 0:
    #Get a random proxy
    proxy = random.choice(proxyList)

    try:
        test = requests.get("https://google.com", proxies = {"http": proxy}, timeout=3)
        if test.status_code == 200:
            print('serching for new proxy...')
            
            proxy = random.choice(proxyList)
            test = requests.get("https://google.com", proxies = {"http": proxy}, timeout=3)
            
            es=0
            
            while es < 2:
                print(f'Proxy found, retriving data from page {numberPage}')
                headers = {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',
                'Host': 'shield.pythonanywhere.com',
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
                'Accept-Encoding': 'gzip, deflate, br',
                'Connection': 'keep-alive'
                }

                print(proxy)
                res = requests.get(
                    target,
                    headers=headers,
                    proxies={"http":proxy}
                    )
                if res.status_code == 200:

                    print("site found succesfully.")
                    soup = bs(res.content,'html.parser')
                    cards= soup.find_all('div',{'class':'card-body'})
                    for card in cards:
                        dict={
                            'Titre':card.find('h5').text,
                            'prix':card.find('p',{'class':'card-price'}).text,
                            'description':card.find('p',{'class':'card-text'}).text
                        }
                        print(card.find('h5').text)
                        print(card.find('p',{'class':'card-price'}).text)
                        print(card.find('p',{'class':'card-text'}).text)
                        listproducts.append(dict)
                    print(listproducts)
                else:
                    print("Code statut: ",res.status_code)
                
                numberPage=numberPage +1
                es= es+1
            counter = counter +1
            if counter == 7:
                print('Fini')
                break    
    except Exception as error:
        print("Error:", error)
    
    trial -= 1

print('tout les produit', listproducts)

# #Test if that proxy works properly
# if proxy:
#     #Headers get from ChatGPT
#     """Question asked: Python headers to act as a browser with user-agent, 
#     host and any relevant information that 
#     makes the request looks coming from google chrome."""

#     headers = {
#     'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36',
#     'Host': 'shield.pythonanywhere.com',
#     'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
#     'Accept-Encoding': 'gzip, deflate, br',
#     'Connection': 'keep-alive'
# }
#     res = requests.get(
#         target,
#         headers=headers,
#         proxies={"http":proxy}
#     )
#     print(proxy)
#     listproducts=[]
#     if res.status_code == 200:
#         print("site found succesfully.")
#         soup = bs(res.content,'html.parser')
#         cards= soup.find_all('div',{'class':'card-body'})
#         for card in cards:
#             dict={
#                 'Titre':card.find('h5').text,
#                 'prix':card.find('p',{'class':'card-price'}).text,
#                 'description':card.find('p',{'class':'card-text'}).text
#             }
#             print(card.find('h5').text)
#             print(card.find('p',{'class':'card-price'}).text)
#             print(card.find('p',{'class':'card-text'}).text)
#             listproducts.append(dict)
#         print(listproducts)
#     else:
#         print("Code statut: ",res.status_code)