class MailboxController < ApplicationController
    
    before_action :authenticate_with_http_digest

    def inbox
        @inbox = mailbox.inbox
        @active = :inbox
    end
    
    def sent
        @sent = mailbox.sentbox
        @active = :sent
    end
    
    def trash
        @trash = mailbox.trash
        @active = :trash
    end

    
end
