class Post < ActiveRecord::Base
    
    belongs_to :user
    
    has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
     validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
     
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
