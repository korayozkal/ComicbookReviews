class UsersController < ApplicationController
skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        #binding.pry
        @user = User.new(user_params)
        if @user.save
        session[:user_id] = @user.id
        
        redirect_to @user 
        #session[:user_id] = @user.id #we are logging in
        else
          render :new
        end
      end

    def show
        redirect_if_not_logged_in
         #@user = User.find(params[:id])
         #Or I can use
         @user = User.find_by_id(params[:id]) #this will bring nil
         redirect_to '/' if !@user   # -A- we are directing to home if it is not a user
     end

    
private

def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
