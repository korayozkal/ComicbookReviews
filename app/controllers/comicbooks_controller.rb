class ComicbooksController < ApplicationController
      before_action :redirect_if_not_logged_in

    def new
        @comicbook = Comicbook.new
    end

    def create
        @comicbook = current_user.comicbooks.build(comicbook_params)
        if @comicbook.save
           redirect_to @comicbook#workingcode
        else
           render :new
        end
        
    end

    def show
        @comicbook = Comicbook.find(params[:id])#workingcode
    end
   
    def index 
        @comicbooks= Comicbook.all #workingcode
    end 

    def edit 
        #binding.pry
        @comicbook = Comicbook.find_by_id(params[:id])
        #@comicbook = Comicbook.find(params[:id]) #test code
        redirect_to comicbooks_path if  @comicbook.user != current_user
        #@comicbook = current_user.comicbooks.update(comicbook_params)
    end 

    def update #add current_user
        @comicbook = Comicbook.find_by_id(params[:id])
        redirect_to comicbooks_path if @comicbook.user != current_user
        #if @comicbook.update(comicbook_params)#test version
        if @comicbook = current_user.comicbooks.update(comicbook_params)
           redirect_to comicbook_path(@comicbook)
        else
           render :edit
        end
    end 

    def destroy
        @comicbook = Comicbook.find(params[:id])#workingcode
        redirect_to comicbooks_path if  @comicbook.user != current_user
     if @comicbook.destroy#workingcode
        redirect_to comicbooks_path(@comicbook)#workingcode
     
     else
        redirect_to comicbook_path(@comicbook)
     end 
    end 

    private
    def comicbook_params
        params.require(:comicbook).permit(:title, :number, :writer, :artist, :publisher)
    end

    #def set_book
    #@comicbook = Comicbook.find_by_id(params[:id])
    #end 
end
