class UsersController < ApplicationController

    def index
        # show all the users
        # @users is an array/hash? of all users. we use .each so must be array
        @users = User.all
        render :index
    end

    def show
        # shows an individual
        @user = User.find(params[:id])
        render :show
    end

    def new
        # everything inside of this user is empty
        @user = User.new
        render :new
    end

    def create
        # we need @ bc were in users controller
        @user = User.new(user_params)
        if @user.save!
            login!(@user)
            redirect_to user_url(@user) #users_url == every user   user_url(:id) == user_url(user)
        else
            # render would redirect unsaved user
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
