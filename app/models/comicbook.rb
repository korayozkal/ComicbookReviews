class Comicbook < ApplicationRecord
    belongs_to :user #missing part in the logicß
    has_many :reviews
    has_many :users, through: :reviews 

    validates_presence_of :title, :number  
      
end


