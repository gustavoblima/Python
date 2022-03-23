from apify_client import ApifyClient
import json

class Mapscraper:
    def maps_search_parameters(key, maxPl, Ctr, lang, maxRws, maxImg, cov):
          #Prepare search INPUT(settings)
          run_input = {
            "searchStringsArray": [key],
            "maxCrawledPlaces": maxPl,
            "Country": Ctr,
            "language": lang,
            "maxReviews": maxRws,
            "maxImages": maxImg,
            "Zoom": cov, 
            "proxyConfig": { "useApifyProxy": True },
        }
          return run_input
    
          
    def maps_search_place(TOKEN, run, actor_apify):
        # Initialize the ApifyClient with your API token
        client = ApifyClient(TOKEN)
        # Run the actor and wait for it to finish
        run = client.actor(actor_apify).call(run_input=run)

        # Fetch and print actor results from the run's dataset (if there are any)
        for item in client.dataset(run["defaultDatasetId"]).iterate_items():
            json_title = json.dumps(item['title'])
            json_catname = json.dumps(item['categoryName'])
            json_add = json.dumps(item['address'])
            print(json_title)
            print(json_catname)
            print(json_add)
        return item