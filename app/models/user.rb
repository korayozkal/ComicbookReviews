class User < ApplicationRecord
    has_many :comicbooks
    has_many :reviews
    has_many :reviewed_comicbooks, -> {distinct}, through: :reviews, source: :comicbook  
    
    has_secure_password 
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true 

end 
