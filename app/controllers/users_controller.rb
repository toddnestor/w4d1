class UsersController < ApplicationController
  private
  def required_params
    params.require(:user).permit(:username)
  end
end
