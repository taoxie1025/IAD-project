class WelcomeController < ApplicationController

    def home
      @posts = Post.all
      if params[:search]
       @posts = Post.search(params[:search]).order("created_at DESC")
      else
       @posts = Post.all.order('created_at DESC')
      end
    end
    
    
    def about
    end

    

end
