class SessionsController < ApplicationController
  skip_before_action  :redirect_if_not_logged_in

    def create
       #binding.pry
       @user = User.find_by(username: params[:user][:username])
       if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
          flash[:message] = "Incorrect login info, please try again"
          render :new
        end
      end

      def google
        #find_or_create a user using the attributes auth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
          user.username = auth["info"]["first_name"]
          user.password = SecureRandom.hex(10) #is an interface to secure random number generators which are suitable for generating session keys
        end 
        if @user.save
           session[:user_id] = @user.id
           redirect_to user_path(@user)
        else
           redirect_to '/'
        end
      end

      def destroy
        session.clear
        redirect_to root_path
      end

      private
      def auth
        request.env['omniauth.auth']
      end
    end 