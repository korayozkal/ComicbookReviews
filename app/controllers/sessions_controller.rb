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
          user.password = SecureRandom.hex(10)
        end 
        if @user.save
           session[:user_id] = @user.id
           redirect_to user_path(@user)
        else
           redirect_to '/'
        end
      end

        #def google
         # u = User.find_or_create_with_oauth(auth)
        #session[:user_id] = u.id  
        #redirect_to '/comicbooks'

        #def google
          # @user = User.find_or_create_with_oauth(auth)
          #if @user.save
          #session[:user_id] = @user.id
          #redirect_to user_path(@user)
          #else
          #redirect_to '/'
        #end

      def destroy
        session.clear
        redirect_to root_path
      end

      private
      def auth
        request.env['omniauth.auth']
      end
    end 