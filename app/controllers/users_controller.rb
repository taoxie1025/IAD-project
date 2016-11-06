class UsersController < ApplicationController
    
    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            # handle successful save
            redirect_to :users => :show
        else
            render 'new'
        end
    end
    
    def profile
    end
    
    def show
    end
    
    
     private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    

    
end
