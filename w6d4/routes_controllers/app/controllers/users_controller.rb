
class UsersController < ApplicationController
  def index
    # debugger

    if params[:query] 
      user = User.where("username LIKE '%#{params[:query]}%' ")
    else
      user = User.all
    end
    
    render json: user
    # User.all
    #check if query present
    #if present, use query to filter users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if user
      user.update!(user_params)
      render json: user, status: :ok
    else
      render json: user.errors.full_messages, status: :non_found
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render json: user
    #redirect_to '/users/new', :notice => "Your user has been deleted"
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end


username => anya
awefawuhfausdhf
query => 'awefawuhfausdhf'

params[:id] = 1
