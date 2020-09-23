class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in
    #gives these methods access in the views! 
    before_action :redirect_if_not_logged_in

    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        #if current_user is already defined equal to current_user if not find the user in the user table
        #recommended not to use @user so make sure you are consistent
        #@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in
    !!current_user
    #or I can use !!session[:user_id]
    end

    def redirect_if_not_logged_in
        flash[:message] = "Please Login!"
        redirect_to '/' if !logged_in

        #unless logged_in
        #redirect_to root_path, notice: "Please login" #check if the notice working
        #or to keep it simple I can  redirect_to '/' if !logged_in
        #redirect_to '/' if !logged_in
      #end
    end

end
