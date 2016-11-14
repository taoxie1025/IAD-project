class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :mailbox, :conversation
  
    private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in first."
        redirect_to login_url
      end
    end
    
    def mailbox
      @mailbox ||= current_user.mailbox
    end
    

    def conversation
      @conversation ||= mailbox.conversations.find(params[:id])
    end

    
end
