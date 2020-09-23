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

      def destroy
        session.clear
        redirect_to root_path
      end

end
