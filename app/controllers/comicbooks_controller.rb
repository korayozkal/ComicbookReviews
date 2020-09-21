class ComicbooksController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @comicbook = Comicbook.new
    end

    def create
        #binding.pry
        #@comicbook = Comicbook.new(comicbook_params)
        @comicbook = current_user.comicbooks.build(comicbook_params)
        if @comicbook.save
           redirect_to @comicbook
        else
           render :new
        end
        
    end 

    def show
        @comicbook = Comicbook.find(params[:id])
    end
   
    def index 
        @comicbooks= Comicbook.all 
    end 


    private
    def comicbook_params
        params.require(:comicbook).permit(:title, :number, :writer, :artist, :publisher)
    end

end
