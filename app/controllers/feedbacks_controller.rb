class FeedbacksController < ApplicationController
    
    def new
        @feedback = Feedback.new
    end
    
    def create
        @feedback = Feedback.new(post_params)
        if @feedback.save
            flash[:success] = "Comment recieved, Thanks!"
            redirect_to root_url
            #todo render current page
        else
            render ''  
            #todo render current page
        end
    end
    
    private

    def post_params
      params.require(:feedback).permit(:comment, :rating, :sender_id, :recipient_id, :postId)
    end
    
    
end
