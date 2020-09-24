    

    <%= form_for [@comicbook, @review] do |f| %>

<% if @review.errors.any? %>
<div id="error_explanation">
  <h2><%= pluralize(@review.errors.count, "error") %> prohibited this Review from being saved:</h2>

  <ul>
    <% @review.errors.full_messages.each do |message| %>
    <li><%= message %></li>
    <% end %>
  </ul>
</div>
<% end %>









class ReviewsController < ApplicationController
      #before_action :redirect_if_not_logged_in
      #before_action :set_comicbook, only: [:index, :new]
      #before_action :set_review, only: [:show, :edit, :update]

    def new 
      @comicbook = Comicbook.find(params[:comicbook_id])
      @review = Review.new
    end

def create
      @comicbook = Comicbook.find(params[:comicbook_id])
      @review = current_user.reviews.build(review_params)
      @review.comicbook = @comicbook
      if @review.save
       redirect_to @review
      else
        render :new
      end
    end

    #def create
#@comicbook = Comicbook.find(params[:comicbook_id])
#@review = @comicbook.reviews.build(review_params)
      #@review.comicbook = @comicbook
      #@review.comicbook_id = @comicbook.id
     # @review.user_id = current_user.id 
      #if @review.save
     # redirect_to @review
      #else
      #render :new
      #end
    #end 

    def show  
      @review = current_user.reviews.build(review_params)
    end

    def index
    @comicbook = Comicbook.find(params[:book_id])
    @reviews = @comicbook.reviews 
    redirect_to @reviews
    end 


      #def create
      #@comicbook = Comicbook.find(params[:comicbook_id])
      #@review = current_user.reviews.build(review_params)
      #@review.comicbook = @comicbook
      #if @review.save
       #  redirect_to @review
      #else
        #render :new
      #end
    #end

    #def index notes 
    #Jen
      #if params[comicbook_id]  
      #@comicbook= Comicbook.find_by_id(params[comicbook_id])
      #if @comicbook #we know if the comicbook exist
      #@comicbooks = @comicbook.reviews
      #else
      #flash[:message] = "Comicbook doesn't exists"
      #@review = Review.all
      #end

      #def new 
        #@comicbook = Comicbook.find(params[:comicbook_id])
        #@review = Review.new

  
      #end


      private

      def review_params
      params.require(:review).permit(:rating, :comment)
      end

      #def set_comicbook
           #@comicbook = Comicbook.find(params[:comicbook_id])
      #end 
      #def set_review
           #@review = Review.find(params[:id])
      #end

end



<%= form_for [@comicbook, @comicbook.reviews.build] do |f| %>








  #Experiment ABOVE 
  #def new 
  #@comicbook = Comicbook.find(params[:comicbook_id])
  #@review = Review.new
#end

#def create
  #binding.pry
  #@comicbook = Comicbook.find(params[:comicbook_id])
  #@review = current_user.reviews.build(review_params)
  #@review.comicbook = @comicbook
  #if @review.save
  # redirect_to @review
 # else
    #render :new
  #end
#end

#def show  
  #@review = current_user.reviews.build(review_params)
#end

#def index
#@comicbook = Comicbook.find(params[:book_id])
#@reviews = @comicbook.reviews 
#redirect_to @reviews
#end 


  #private
  #def review_params
  #params.require(:review).permit(:rating, :comment)
  ##end

  #def set_comicbook
       #@comicbook = Comicbook.find(params[:comicbook_id])
  #end 
  #def set_review
       #@review = Review.find(params[:id])
  #end



  <h1>Review for <%= @comicbook.title%> issue, <%= @comicbook.number %> </h1>
 <p>Rating: <%= @review.rating %></p>
 <p>Comment<%= @review.comment %></p>


<h1>Reviews</h1>
<h2><%= @comicbook.title%>, issue: <%= @comicbook.number%><h2>

<% @reviews.each do |r| %>
<h3><%= r.user.username%> rated with <%= r.rating%> stars</h3>
<h3><%= r.user.username%> 's review is below </h3>
<h3><%= r.comment%><h3>
<br>
<br>
<% end %>

 


<% if @comicbook.user == current_user %>
<%= link_to 'Review this Comicbook', new_comicbook_review_path(@comicbook) %>
<br>
<br>

<button type="button"><%= link_to 'Edit', edit_comicbook_path(@comicbook) %> </button>
<button type="button"><%= link_to 'Delete', @comicbook, method: :delete, data: { confirm: 'Are you sure?' } %></button>
<% end %>

<h1> All Comicbooks </h1>

<% @comicbooks.each do |comicbook| %>
<p><%= link_to comicbook.title, comicbook_path(comicbook)%> , issue <%= comicbook.number %></p>
<% end %>