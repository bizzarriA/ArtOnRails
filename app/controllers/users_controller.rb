class UsersController < ApplicationController
  before_action :set_user

  # GET /users/1
  # GET /users/1.json
  def show

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {})
  end
end
