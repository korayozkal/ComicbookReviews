class User < ApplicationRecord
    has_many :comicbooks
    has_many :reviews
    has_many :reviewed_comicbooks, -> {distinct}, through: :reviews, source: :comicbook  
    
    has_secure_password 
    validates_presence_of :username, :email, uniquness: true 

end 
