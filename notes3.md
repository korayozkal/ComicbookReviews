 
class ReviewsController < ApplicationController
  #before_action :redirect_if_not_logged_in
  #before_action :set_comicbook, only: [:index, :new]
  #before_action :set_review, only: [:show, :edit, :update]

  def index 
    @comicbook = Comicbook.find(params[:comicbook_id])
    @reviews = @comicbook.reviews
  end
  
  
  def show
    @review = Review.find(params[:id])
  end

  def new
    @comicbook = Comicbook.find(params[:comicbook_id])
    #@review = Review.new
    @review = @comicbook.reviews.build
  end

  def edit
    @comicbook = Comicbook.find_by_id(params[:comicbook_id])
    @review = Review.find_by(params[:id]) #This was working
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

  #def create
    #@comicbook = Comicbook.find(params[:comicbook_id])
    #@review = current_user.reviews.build(**review_params, comicbook_id: params[:comicbook_id])
    #@review.comicbook = @comicbook
    #if @review.save
      #redirect_to comicbook_reviews_path(@review.comicbook)
    #else
      #render :new
   # end
  #end

    def create
    @comicbook = Comicbook.find(params[:comicbook_id])
    @review = current_user.reviews.build(review_params)
    @review.comicbook = @comicbook
    if @review.save
    redirect_to review_path(@review.comicbook)
    #redirect_to comicbook_reviews_path(@review.comicbook)
    else
     render :new
    end
  end


  def destroy
    @comicbook = Comicbook.find_by_id(params[:comicbook_id])
    @review = Review.find_by(params[:id])
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


NEW HTML

<h1>New Review for <%= @comicbook.title%>, issue <%= @comicbook.number%></h1>

<%= form_for [@comicbook, @review] do |f| %>


<% if @review.errors.any? %>
<div id="error_explanation">
<h2><%= pluralize(@review.errors.count, "error") %> prohibited this @review from being saved:</h2>

  <ul>
    <% @review.errors.full_messages.each do |message| %>
    <li><%= message %></li>
    <% end %>
  </ul>
</div>
<% end %>
<br>
<div class="field">
  <%= f.label :rating %>
  <%= f.select(:rating, [1,2,3,4,5], :prompt => 'Rate') %>
</div>
<br>
<div class="field">
  <%= f.label :comment %>
  <br>
  <br>
  <%= f.text_area :comment, size: "30x5"  %>
</div>
<br>
<div class="actions">
  <%= f.submit %>
</div>
<% end %>

SHOW HTML 

<h1>New Review for <%= @review.comicbook.title%>, issue <%= @review.comicbook.number%></h1>

<h2>RATING for this Comic book is: <%= @review.rating%> </h2>
<br>
<h2>COMMENTS<h2>
<h2><%= @review.comment%><h2>
<br>
<h2>Reviewed by the user: <%= @review.user.username%><h2>

<br>
<br>
<button type="button"><%= link_to 'Edit', edit_review_path(@review) %> </button>
<button type="button"><%= link_to 'Delete', @review, method: :delete, data: { confirm: 'Are you sure?' } %></button>





EDIT HTML


<h1>Edit Review for <%= @review.comicbook.title%>
<%= form_for [@comicbook, @review] do |f| %>


<% if @review.errors.any? %>
<div id="error_explanation">
<h2><%= pluralize(@review.errors.count, "error") %> prohibited this @review from being saved:</h2>

  <ul>
    <% @review.errors.full_messages.each do |message| %>
    <li><%= message %></li>
    <% end %>
  </ul>
</div>
<% end %>
<br>
<div class="field">
  <%= f.label :rating %>
  <%= f.select(:rating, [1,2,3,4,5], :prompt => 'Rate') %>
</div>
<br>
<div class="field">
  <%= f.label :comment %>
  <br>
  <br>
  <%= f.text_area :comment, size: "30x5"  %>
</div>
<br>
<div class="actions">
  <%= f.submit %>
</div>
<% end %>

INDEX HTML

<h1>Reviews</h1>
<%= @comicbook.title%>, issue: <%= @comicbook.number%>
<% @reviews.each do |r| %>
<p>Reviewed by <%= r.user.username %> Rating: <%= r.rating %></p>
<p><%= r.comment%></p>
<% end %>
