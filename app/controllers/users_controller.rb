class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  private

# add the private user_params method to sanitize the input from the form (this is a new Rails 4 thing and it's required). 
  def user_params
    params.require(:user).permit(:name,:last_name, :email, :password, :password_confirmation)

  end


end

