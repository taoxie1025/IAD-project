class Post < ActiveRecord::Base
    
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :courseName, presence: true
    validates :courseCode, presence: true
    validates :department, presence: true
    validates :description, presence: true, length: { maximum: 140 }
    
    def self.search(search)
     if search
      where("courseName LIKE ? OR courseCode LIKE ? OR department LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
     else
      scoped
     end
    end
    
end
