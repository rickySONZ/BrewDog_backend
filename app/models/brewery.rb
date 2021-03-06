class Brewery < ApplicationRecord

    has_many :favorites
    has_many :users, through: :favorites
    validates :uid, uniqueness: true
    validates :name, presence: true
    

    ## Methods for fixing breweries without lat and long
    def fix_latitude()
        result = Geocoder.search("#{brewery_hash["address"]} #{brewery_hash["city"]}, #{brewery_hash["state"]}")
        coord = result.first.coordinates
        return coord[0]
    end

    def fix_longitude()
        result = Geocoder.search("#{brewery_hash["address"]} #{brewery_hash["city"]}, #{brewery_hash["state"]}")
        coord = result.first.coordinates
        return coord[1]
    end
end
