class User < ApplicationRecord
    has_many :comicbooks
    has_many :reviews
    has_many :reviewed_comicbooks, -> {distinct}, through: :reviews, source: :comicbook  
    has_secure_password 

#validates_presence_of :username, uniquness: true, {case_sensitive: false} 
#validates :password, length: {in : 4..72}
end 
