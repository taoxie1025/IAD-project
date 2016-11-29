class WelcomeController < ApplicationController

    def home
        # @user = User.find(1)
        # @user.isAdmin = true;
        # @user.save
    end
    
    
    def about
    end

    def search
        if params[:search]
            @posts = Post.search(params[:search])
        else
            @posts = Post.all.order('created_at DESC')
        end
    end
    

end
