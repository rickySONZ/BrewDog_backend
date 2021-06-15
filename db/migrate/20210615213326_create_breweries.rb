class CreateBreweries < ActiveRecord::Migration[6.1]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :longitude
      t.string :latitude
      t.string :phone
      t.string :url
      t.string :uid

      t.timestamps
    end
  end
end

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