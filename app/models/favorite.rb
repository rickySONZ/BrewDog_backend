class Favorite < ApplicationRecord

    belongs_to :brewery
    belongs_to :user

    validates :user_id, uniqueness: { scope: :brewery_id }
end
