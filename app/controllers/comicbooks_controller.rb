class ComicbooksController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_comicbook, only: [:edit, :destroy]
    before_action :set_comicbook_id, only: [:show, :update]
    

  def new
      @comicbook = Comicbook.new
  end

  def create
      #binding.pry
      @comicbook = current_user.comicbooks.build(comicbook_params)
      if @comicbook.save
         redirect_to @comicbook
      else
         render :new
      end
      
  end

  def show
      redirect_to comicbooks_path if !@comicbook
  end
 
  def index 
      @comicbooks= Comicbook.all 
  end 

  def edit 
      #binding.pry
  end 

  def update 
      
    if current_user == @comicbook.user 

        if @comicbook.update(comicbook_params)

            redirect_to comicbook_path(@comicbook)
        else
            render :edit
        end
    else
        redirect_to comicbooks_path
    end
  end 

  def destroy
      if current_user == @comicbook.user 
         @comicbook.destroy
         redirect_to comicbooks_path
      else 
         redirect_to comicbooks_path
      end 
  end 

  private

  def set_comicbook
    @comicbook = Comicbook.find(params[:id])
  end 
  def set_comicbook_id
    @comicbook = Comicbook.find_by_id(params[:id])
  end 
  
  def comicbook_params
      params.require(:comicbook).permit(:title, :number, :writer, :artist, :publisher)
  end



end