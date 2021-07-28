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
                if result && result.first
                    coord = result.first.coordinates
                    b.latitude = coord[0]
                    b.longitude = coord[1]
                end
            end
            
            b.save
        end
    end
end
