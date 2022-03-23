from Apify import Mapscraper
import sqlite3
from flask import Flask, request, url_for, session, g, redirect, abort, render_template, flash, json, jsonify

# configuração
DATABASE = "blog.db"
SECRET_KEY = 'pudim'

#from Apify import Mapscraper

""" Configuration keys for maps research"""
#Token used to connect to Apify platform
MY_APIFY_TOKEN = "apify_api_G5qIfLH4U3mzClhidthbMFCYVXKU6G2KpmEk"
#An actor is a standard name of a specific scraper configured from Apify api
actor_apify = "drobnikj/crawler-google-places"
#This is your main string. The place you're looking for.
#search_key = "Hoteis em Manaus"
#How many places is it necessary to be displayed in your search
max_places = 5
#Edit your location choosing your country
country = "Brazil"
#Set your language "en", "es", "pt", "cn" and so on... 
language = "pt-BR"
#Should be always 0 check documentation to know better about this parameter
max_reviews = 0
#It shows the number of images. Not used too.
max_images = 0
#This parameters is used to set the distance of your search area on the map.
coverage_area = 4

app = Flask(__name__)
app.config.from_object(__name__)

def conectar_bd():
    return sqlite3.connect(app.config['DATABASE'])

@app.before_request
def antes_requisicao():
    g.bd = conectar_bd()

@app.teardown_request
def depois_request(exc):
    g.bd.close()


@app.route('/')
@app.route('/apify', methods=["GET", "POST"])
def apify():
    erro = None
    if request.method == "POST":
        if request.form['SearchKey'] != "":
            search_key = request.form.get('SearchKey', type=str)
            get_parameters = Mapscraper.maps_search_parameters(
            search_key, max_places, country,
            language, max_reviews, max_images, coverage_area)
            maps = Mapscraper.maps_search_place(MY_APIFY_TOKEN, get_parameters, actor_apify)
            return jsonify(json.dumps(maps))
        else:
            erro = "Aguardando pesquisa"
           
    return render_template('apify.html', erro=erro)
app.run(host="0.0.0.0", port=5000, debug=True)
