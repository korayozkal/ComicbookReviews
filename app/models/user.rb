class User < ApplicationRecord
    has_many :reviews
    has_many :comicbooks, through: :reviews 
    has_secure_password 
    #validates_presence_of :username, uniquness: true 
end
