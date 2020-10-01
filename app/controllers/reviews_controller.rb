 
class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :set_comicbook, only: [:new, :index, :show, :edit, ]
  before_action :set_review, only: [:show, :edit, :destroy]

  def new
    @review = @comicbook.reviews.build
  end

  def create
    @comicbook = Comicbook.find(params[:comicbook_id])
    @review = current_user.reviews.build(review_params)
    @review.comicbook = @comicbook
      if @review.save
         redirect_to @review
         #redirect_to comicbook_reviews_path(@review.comicbook)
      else
         render :new
      end
  end

  def index 
    @reviews = @comicbook.reviews
  end
  
  
  def show
    #redirect_to comicbook_reviews_path(@review.comicbook) if !@review.comicbook
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
     if current_user == @review.user
       
        if @review.update(review_params)
           redirect_to @review
        else
           render :edit
        end 
        else 
           redirect_to comicbooks_path
        end 
  end

  def destroy
    if current_user == @review.user
       @review.destroy
       redirect_to comicbook_path(@review.comicbook)
    else 
       redirect_to comicbooks_path
    end
end 

  private
  def set_comicbook
    @comicbook = Comicbook.find_by_id(params[:comicbook_id])
  end

  def set_review
    @review = Review.find_by_id(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end 
end 