class ComicbooksController < ApplicationController
      before_action :redirect_if_not_logged_in

    def new
        @comicbook = Comicbook.new
    end

    def create
        #binding.pry
        @comicbook = Comicbook.new(comicbook_params)
        #@comicbook = current_user.comicbooks.build(comicbook_params)
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

    def edit #add current_user
        #binding.pry
        #@comicbook = Comicbook.find_by_id(params[:id])
        @comicbook = Comicbook.find(params[:id]) #TRY THIS TOO!
        #@comicbook = current_user.comicbooks.update(comicbook_params)
        #redirect_to comicbooks_path if  @comicbook.user != current_user
    end 

    def update #add current_user
        @comicbook = Comicbook.find_by_id(params[:id])
        #redirect_to comicbooks_path if  @comicbook.user != current_user
        if @comicbook.update(comicbook_params)
           redirect_to comicbook_path(@comicbook)
        else
           render :edit
        end
    end 

    def destroy
        @comicbook = Comicbook.find(params[:id])
        #if current_user == comicbook.user
           @comicbook.destroy
           redirect_to comicbooks_path(@comicbook)
        #else
           # redirect_to comicbook_path(@comicbook)
        #end
    end 


    private
    def comicbook_params
        params.require(:comicbook).permit(:title, :number, :writer, :artist, :publisher)
    end

end
