class UsersController < ApplicationController

  def update
    user = User.find(params[:id])
    user.update(user_params)
  end
  
end
