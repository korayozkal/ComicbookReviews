class SessionsController < ApplicationController

    def create
        #binding.pry
       # @user = User.find_by(username: params[:username])
       @user = User.find_by(username: params[:user][:username])
       if @user && @user.authenticate(params[:user][:password])
        #if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to @user
        
        else
          flash[:message] = "Incorrect login info, please try again"
          render :new
        end
      end

      def destroy
        session.clear
        redirect_to root_path
      end

end
