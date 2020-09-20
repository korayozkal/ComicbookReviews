class UsersController < ApplicationController

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
        #@user = User.find(params[:id])
         #Or I can use
         @user = User.find_by_id(params[:id]) #this will bring nil
         #redirect_to '/' if !@user   #we are directing to home if it is not a user
     end

    
private

def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
