 
class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in
  #before_action :set_comicbook, only: [:index, :new]
  #before_action :set_review, only: [:show, :edit, :update]

  def new
    @comicbook = Comicbook.find_by_id(params[:comicbook_id])
    #@review = Review.new
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
    @comicbook = Comicbook.find_by_id(params[:comicbook_id])
    @reviews = @comicbook.reviews
    #@review.comicbook = @comicbook# checking this one 
  end
  
  
  def show
    @comicbook = Comicbook.find_by_id(params[:comicbook_id])#
    @review = Review.find_by_id(params[:id])
    #redirect_to comicbook_reviews_path(@review.comicbook) if !@review.comicbook
  end

 

  def edit
    @comicbook = Comicbook.find_by_id(params[:comicbook_id])
    @review = Review.find_by_id(params[:id])
    #@review = Review.find_by(params[:id]) 
    #@review = @comicbook.reviews.find(params[:id])

  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    #@comicbook = Comicbook.find_by_id(params[:comicbook_id])
    @review = Review.find_by_id(params[:id])
    #if current_user == comicbook.user
    @review.destroy
       redirect_to comicbook_path
     #else 
end 

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end 
end 