class AuthController < ApplicationController
    def signup_index
        @user = User.new
    end
    def signup_create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :signup_index, :status => 404
        end
    end

    def logout
        if session[:user_id]
            session[:user_id] = nil
            redirect_to root_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end