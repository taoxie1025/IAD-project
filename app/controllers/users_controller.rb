class UsersController < ApplicationController


    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        puts 'user params:', user_params
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
    
    
     def set_as_admin
        @user = User.find(params[:id])
        @user.isAdmin = true
        @user.save
        flash[:success] = "Set as administrator successfully"
        render 'admin/show'
    end
    
    def set_as_user
        @user = User.find(params[:id])
        @user.isAdmin = false
        @user.save
        flash[:success] = "Set as user successfully"
        if current_user.present? && current_user.isAdmin
            render 'admin/show'
        else
            render 'welcome/home'
        end
    end
    
    def delete_user
        @user = User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        render 'admin/show'
    end
    
    
    private

        def user_params
          params.require(:user).permit(:name, :email, :password,
                                       :password_confirmation, :image)
        end
        

    
end
