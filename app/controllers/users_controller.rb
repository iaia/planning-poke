class UsersController < ApplicationController
  def new; end

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id

    respond_to do |format|
      format.html { redirect_to new_room_path }
      format.json { @user }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def redirect_when_signed_in
    if session[:user_id]&.positive?
      redirect_to new_room_path
    end
  end
end
