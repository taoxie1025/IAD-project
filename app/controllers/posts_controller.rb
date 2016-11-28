class PostsController < ApplicationController
    
    before_action :logged_in_user, only: [:create, :destroy]
    
    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "You Ad is created!"
            redirect_to :controller => 'posts', :action => 'show', :id => @post.id
        else
            render 'new'
        end
    end
    
    def destroy
    end
    
    def show
        @feedback = Feedback.new
    end
    
    def edit
        @post = Post.find(params[:post_id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(post_params)
            flash[:success] = "You changes were saved successfully"
            redirect_to :controller => 'posts', :action => 'show', :id => @post.id
         else
            render 'edit'
        end
    end
    
    def destroy
        Post.find(params[:id]).destroy
        flash[:success] = "Post deleted"
        if current_user.isAdmin
            redirect_to(:back)
        else
            redirect_to users_url
        end
    end
    
    private

    def post_params
      params.require(:post).permit(:courseName, :courseCode, :price, :department, :description)
    end
    
end
