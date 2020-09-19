class SessionsController < ApplicationController

    def destroy
        session.clear
        redirect_to root_path
    end

    #def destroy
        #User.find(session[:user_id]).destroy      
        #session[:user_id] = nil         
        #redirect_to root_path 
    #end  

end
