class FeedbacksController < ApplicationController
    
    def new
        @feedback = Feedback.new
    end
    
    def create
        @feedback = Feedback.new(post_params)
        if @feedback.save
            flash[:success] = "Thanks for your feedback!"
            @post = Post.findBy(@feedback.postId)
            redirect_to :controller => 'posts', :action => 'show', :id => @feedback.postId
        else
            flash[:danger] = "Your feedback did not submit successfully. #{@feedback.errors.full_messages.to_sentence}"
            @post = Post.findBy(@feedback.postId)
            redirect_to :controller => 'posts', :action => 'show', :id => @feedback.postId
        end
    end
    
    private

    def post_params
      params.require(:feedback).permit(:comment, :rating, :sender_id, :recipient_id, :postId)
    end
    
    
end
