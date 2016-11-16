class Post < ActiveRecord::Base
    
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :courseName, presence: true
    validates :courseCode, presence: true
    validates :department, presence: true
    validates :description, presence: true, length: { maximum: 500 }
    
    def self.search(search)
     if search
      where("courseName LIKE ? OR courseCode LIKE ? OR department LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
     else
      scoped
     end
    end
    
    def self.findBy(postId)
     Post.find_by id: "#{postId}"
    end
    
end
