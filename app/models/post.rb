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
    #  where("courseName LIKE ?", "%#{search}%")
    #  where("courseCode LIKE ?", "%#{search}%") There is problem here, it always returns the last line
    #  where("department LIKE ?", "%#{search}%") which is empty. We need to figure out a way to do such query
    # and watch out the lowercase and uppercase. Right now id doesn't work for one work search, you have to search
    # the whole word -> Database System, not Database
     else
      scoped
     end
    end
    
end
