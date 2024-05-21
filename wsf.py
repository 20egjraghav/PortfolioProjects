from bs4 import BeautifulSoup
import requests
import time
import datetime
import smtplib
import csv

import pandas as pd
# URL = 'https://www.flipkart.com/portronics-sounddrum-p-wireless-speaker-6-7-hrs-playback-time-handsfree-calling-20-w-bluetooth/p/itm209616d588814?pid=ACCGCAYRQMMEP2ZA&lid=LSTACCGCAYRQMMEP2ZAXNFBYD&marketplace=FLIPKART&q=portronics+bluetooth+speakers&store=0pm%2F0o7&srno=s_1_5&otracker=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_na&otracker1=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_na&fm=search-autosuggest&iid=d6e39f1b-6c3e-40b2-a952-5693783e2b73.ACCGCAYRQMMEP2ZA.SEARCH&ppt=sp&ppn=sp&ssid=5f2b8y0thc0000001716194404010&qH=fd97431051239d30'

# headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36", "Accept-Encoding": "gzip, deflate",
#            "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT": "1", "Connection": "close", "Upgrade-Insecure-Requests": "1"}

# page = requests.get(URL, headers=headers)

# soup1 = BeautifulSoup(page.content, "html.parser")
# soup2 = BeautifulSoup(soup1.prettify(), 'html.parser')

# title = soup2.find(class_="VU-ZEz").get_text().strip()
# price = soup2.find(class_="Nx9bqj CxhGGd").get_text().strip()
# rating = soup2.find(class_='XQDdHH').get_text().strip()
# today = datetime.date.today()

# print("Date:- ", today)
# print("Title :- ", title)
# print("Price :- ", price)
# print("Rating :- ", rating)

# header = ['Date', 'Title', 'Price', 'Rating']
# data = [today, title, price, rating]

# with open('FlipkartWebScraper.csv', 'a+', newline='', encoding='UTF8') as f:
#     writer = csv.writer(f)
#     writer.writerow(data)

# Read the data using pandas

# df = pd.read_csv(r'C:\Users\DELL\FlipkartWebScraper.csv')
# print(df)

# Send Mail


def send_mail():
    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    server.ehlo()
    server.login('20egjad020@gitjaipur.com', 'Git@01296156')

    subject = "The product you want to buy is below 4000! Now is your chance to buy!"
    body = "Raghav, This is the moment we have been waiting for. Now is your chance to pick the product of your dreams. Don't miss the opportunity."

    msg = f"Subject: {subject}\n\n{body}"
    server.sendmail(
        'xyz4@gmail.com',
        msg

    )


def check_price():
    URL = 'https://www.flipkart.com/portronics-sounddrum-p-wireless-speaker-6-7-hrs-playback-time-handsfree-calling-20-w-bluetooth/p/itm209616d588814?pid=ACCGCAYRQMMEP2ZA&lid=LSTACCGCAYRQMMEP2ZAXNFBYD&marketplace=FLIPKART&q=portronics+bluetooth+speakers&store=0pm%2F0o7&srno=s_1_5&otracker=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_na&otracker1=AS_QueryStore_OrganicAutoSuggest_1_5_na_na_na&fm=search-autosuggest&iid=d6e39f1b-6c3e-40b2-a952-5693783e2b73.ACCGCAYRQMMEP2ZA.SEARCH&ppt=sp&ppn=sp&ssid=5f2b8y0thc0000001716194404010&qH=fd97431051239d30'

    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36", "Accept-Encoding": "gzip, deflate",
               "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT": "1", "Connection": "close", "Upgrade-Insecure-Requests": "1"}

    page = requests.get(URL, headers=headers)

    soup1 = BeautifulSoup(page.content, "html.parser")
    soup2 = BeautifulSoup(soup1.prettify(), 'html.parser')

    title = soup2.find(class_="VU-ZEz").get_text().strip()
    price = soup2.find(class_="Nx9bqj CxhGGd").get_text().strip()
    rating = soup2.find(class_='XQDdHH').get_text().strip()

    import datetime
    # today = datetime.date.today()
    now = datetime.datetime.now()
    date = now.date()
    time = now.time()

    import csv
    header = ['Date', 'Time', 'Title', 'Price', 'Rating']
    data = [date, time, title, price, rating]

    with open('FlipkartWebScraper.csv', 'a+', newline='', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerow(data)

    if (price < '2000'):
        send_mail()


while (True):
    check_price()
    time.sleep(5)
