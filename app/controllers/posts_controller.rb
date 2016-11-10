class PostsController < ApplicationController
    
    before_action :logged_in_user, only: [:create, :destroy]
    
    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "You Ad is created!"
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    def destroy
    end
    
    def show
        @feedback = Feedback.new
    end
    
    private

    def post_params
      params.require(:post).permit(:courseName, :courseCode, :price, :department, :description)
    end
    
end
