import requests
from bs4 import BeautifulSoup as bs

#Requete aupres des sites
leNouvelliste=requests.get('https://lenouvelliste.com')
haitiLibre=requests.get('https://www.haitilibre.com')
#
soupLenouv=bs(leNouvelliste.content,'html.parser')
soupHaiti=bs(haitiLibre.content,'html.parser')

#pour LeNouvelliste
titreLenouv=soupLenouv.find_all('h1')#recuperer les titres du Nouvelliste
dateLenouv=soupLenouv.find_all('div',{'class':'text-xs text-gray-500 mt-2'})#recuperer les dates du Nouvelliste
contenuLenouv=soupLenouv.find_all('div',{'class':'text-gray-500 text-[16px] mt-4'})#recuperer les articles du Nouvelliste

#Tableau des articles du Nouvelliste avec leurs titres, dates et contenus 
tableauLenouv=[]
for i in range(0,len(contenuLenouv)):
  t2=[]
  for j in range(0,1):
    t2.append(titreLenouv[i].get_text(strip=True))
    t2.append(dateLenouv[i].get_text(strip=True))
    t2.append(contenuLenouv[i].get_text(strip=True))
  tableauLenouv.append(t2)
  
#pour Haitilibre
titreHaiti=soupHaiti.find_all('span',{'class':'titre16color'})
dateHaiti=soupHaiti.find_all('span',{'class':'date'})
contenuHaiti=soupHaiti.find_all('td',{'class':'text'})

#Tableau des articles de HaitiLibre avec leurs titres, dates et contenus 
tableauHaiti=[]
for i in range(0,len(titreHaiti)):
  t2=[]
  for j in range(0,1):
    t2.append(titreHaiti[i].get_text(strip=True))
    t2.append(dateHaiti[i].get_text(strip=True))
    t2.append(contenuHaiti[i].get_text(strip=True))
  tableauHaiti.append(t2)

#fonction de comparaison
def compare_strings(a):
  c=['gang','kidnapping','mort','deces','bandit','disparition','balle','blesse','tue']
  for b in c:
    minimum = min(len(a), len(b)) 
    maximum=max(len(a),len(b))
    count = 0 

    for i in range(minimum):
        if a[i].upper() == b[i].upper():
            count += 1 
    taux=count/maximum
    if taux>=0.8:
      res=True
      break
    else:
      res=False
  return(res)

#fonction pour afficher les articles desires
def affichage(table):
  for c in table:
    for b in c:
      word=str(c).split()
    for mot in word:
      if compare_strings(mot):
        print('Mot retrouve: '+mot)
        print("{title}: "+c[0]+" {dat}:"+c[1])
        break


print("ARTICLES DE LENOUVELLISTE")
affichage(tableauLenouv)

print("ARTICLES DE HAITILIBRE")
affichage(tableauHaiti)