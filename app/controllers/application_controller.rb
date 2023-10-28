class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
      if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
      end
    end

    def is_current_user_exist
        if !Current.user
            flash[:alert] = "You must Login!"
            redirect_to signin_path
        end
        
    end
end
