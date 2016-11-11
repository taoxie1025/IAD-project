class Feedback < ActiveRecord::Base
    
    has_one :sender, :class_name => "User"
    has_one :recipient, :class_name => "User"
    
    validates :comment, presence: true, length: { maximum: 140}
    validates :rating, :inclusion => 1..5
    
    def self.search(id)
        if id
            Feedback.where("recipient_id = ?", "#{id}")
        else
            scoped
        end
    end
    
end
