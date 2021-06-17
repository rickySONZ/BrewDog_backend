class User < ApplicationRecord

    has_many :favorites
    has_many :breweries, through: :favorites

    has_secure_password

    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
