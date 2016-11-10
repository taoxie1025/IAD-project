class WelcomeController < ApplicationController

    def home

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
