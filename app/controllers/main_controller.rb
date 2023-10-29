class MainController < ApplicationController
    def index
        if account_signed_in?
            redirect_to :books
        end
    end
end
