class UsersController < ApplicationController


    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            render 'new'
        end
    end
    
    def show
        @user = current_user
        @posts = @user.posts.paginate(page: params[:page])
    end
    
    
    private

        def user_params
          params.require(:user).permit(:name, :email, :password,
                                       :password_confirmation)
        end
        

    
end
