class User < ActiveRecord::Base
    
    acts_as_messageable
    
    has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, :default_url => ActionController::Base.helpers.asset_path('user_profile_placeholder.png')
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
     
    has_many :posts, dependent: :destroy

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before_save { self.email = email.downcase }
    
    validates :name, presence: true
    validates :email, presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX},
                                uniqueness: { case_sensitive: false}
    has_secure_password
    validates :password, length: { minimum: 6 }, allow_nil: true
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
     BCrypt::Password.create(string, cost: cost)
    end
    
    def mailboxer_name
        self.name
    end

    def mailboxer_email(object)
        self.email
    end
  
end
