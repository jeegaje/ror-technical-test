class SignUpController < ApplicationController
    def index
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :index, :status => 404
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
end