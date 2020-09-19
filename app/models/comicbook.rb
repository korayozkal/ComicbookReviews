class Comicbook < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews  
    #validates_presence_of :title, :number    
end
