class UsersController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only: [:new, :create]

    def new
        render :new
    end
    
    def create
        @user = User.create(user_params)
     
        if @user.save!
            login(@user)
        else
            render :new
        end

    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end
