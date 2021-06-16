require 'httparty'

class Api < ApplicationRecord

    def self.pull_searched_breweries
        @url = "https://api.openbrewerydb.org/breweries/search?query=boston&massachusetts"
        brewery_array = HTTParty.get(@url)
        brewery_array.each do |brewery_hash|
            Brewery.create(:name => brewery_hash["name"],
                 :address => brewery_hash["street"],
                 :city => brewery_hash["city"],
                 :state => brewery_hash["state"],
                 :postal_code => brewery_hash["postal_code"],
                 :longitude => brewery_hash["longitude"],
                 :latitude => brewery_hash["latitude"],
                 :phone => brewery_hash["phone"],
                 :uid => brewery_hash["id"],
                 :url => brewery_hash["website_url"]
            )
        end
        # Thinking of basically pulling from this API and then creating new breweries
        # New breweries would have two functions called on them before instantiation
        # First it would validate that the country and state are the same as the search term
        # This is necessary because the API will pull by any keyword so itll look for any attribute to equal term
        # The second check will check and make sure there is a longitude and latitude
        # If that is not present than we will use the Geocoder gem to pull those points from street address

# id: 9172,
# name: "Boston Beer Co",
# brewery_type: "micro",
# street: "30 Germania St Ste 1",
# city: "Boston",
# state: "Massachusetts",
# postal_code: "02130-2312",
# country: "United States",
# longitude: null,
# latitude: null,
# phone: "6173685000",
# website_url: "http://www.samueladams.com",

    end
end
