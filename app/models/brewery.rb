class Brewery < ApplicationRecord

    has_many :favorites
    has_many :users, through: :favorites

    validates :uid, uniqueness: true
end
