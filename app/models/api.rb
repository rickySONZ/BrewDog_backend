class Api < ApplicationRecord

    def self.pull_searched_breweries
        @url = "https://api.openbrewerydb.org/breweries/search?query=#{search_term}"
        # Thinking of basically pulling from this API and then creating new breweries
        # New breweries would have two functions called on them before instantiation
        # First it would validate that the country and state are the same as the search term
        # This is necessary because the API will pull by any keyword so itll look for any attribute to equal term
        # The second check will check and make sure there is a longitude and latitude
        # If that is not present than we will use the Geocoder gem to pull those points from street address

#         id: 9172,
# obdb_id: "boston-beer-co-boston-2",
# name: "Boston Beer Co",
# brewery_type: "micro",
# street: "30 Germania St Ste 1",
# address_2: null,
# address_3: null,
# city: "Boston",
# state: "Massachusetts",
# county_province: null,
# postal_code: "02130-2312",
# country: "United States",
# longitude: null,
# latitude: null,
# phone: "6173685000",
# website_url: "http://www.samueladams.com",
# updated_at: "2018-08-11T00:00:00.000Z",
# created_at: "2018-07-24T00:00:00.000Z"

    end
end
