class AdminController < ApplicationController
    
    def new
    end
    
    def show
    end
    
    def delete
    end
    
    def show_all_posts
        @user = User.find(params[:id])
    end
    
end
