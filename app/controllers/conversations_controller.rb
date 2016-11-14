class ConversationsController < ApplicationController
    
    before_action :authenticate_with_http_digest
    
    def new
        @receiptient = User.where(id: params[:receiptientID])
        @subject = params[:subject]
    end
    
    def create
        recipients = User.where(id: conversation_params[:recipients])
        if (conversation_params[:body].present? && conversation_params[:subject].present?)
            conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
            flash[:success] = "Your message was successfully sent!"
            redirect_to conversation_path(conversation)
        else
            flash[:danger] = "Message failed to sent!"
            redirect_to :controller => 'conversations', :action => 'new'
        end

    end

    def show
        @receipts = conversation.receipts_for(current_user)
        # mark conversation as read
        conversation.mark_as_read(current_user)
    end
    
     def reply
        current_user.reply_to_conversation(conversation, message_params[:body])
        if (message_params[:body].present?)
            flash[:success] = "Your reply message was successfully sent!"
            redirect_to conversation_path(conversation)
         else
            flash[:danger] = "Message failed to sent!"
            redirect_to :controller => 'conversations', :action => 'show'
        end
     end
     
      def trash
        conversation.move_to_trash(current_user)
        redirect_to mailbox_inbox_path
      end
    
      def untrash
        conversation.untrash(current_user)
        redirect_to mailbox_inbox_path
      end
    
    
    private

    def conversation_params
        params.require(:conversation).permit(:subject, :body, recipients:[])
    end
      
    def message_params
        params.require(:message).permit(:body, :subject)
    end
    
end
