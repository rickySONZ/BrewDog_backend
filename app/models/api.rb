require 'httparty'

class Api < ApplicationRecord

    def self.pull_searched_breweries(e)
        @url = "https://api.openbrewerydb.org/breweries/search?query=#{e}"
        brewery_array = HTTParty.get(@url)
        brewery_array.each do |brewery_hash|
            b = Brewery.new(:name => brewery_hash["name"],
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
            if b.longitude == nil || b.latitude == nil
                result = Geocoder.search("#{brewery_hash["address"]} #{brewery_hash["city"]}, #{brewery_hash["state"]}")
                if result
                coord = result.first.coordinates
                b.latitude = coord[0]
                b.longitude = coord[1]
                end
            end

            #Another conditional that will handle not saving
            #If the city and state dont match the search term explicitly
            b.save
        end
        # Thinking of basically pulling from this API and then creating new breweries
        # New breweries would have two functions called on them before instantiation
        # First it would validate that the country and state are the same as the search term
        # This is necessary because the API will pull by any keyword so itll look for any attribute to equal term
        # The second check will check and make sure there is a longitude and latitude
        # If that is not present than we will use the Geocoder gem to pull those points from street address

    end
end
