class UsersController < ApplicationController
  before_action :redirect_when_signed_in

  def new; end

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id

    if session[:redirect_url_after_logged_in]
      url = session[:redirect_url_after_logged_in]
      session[:redirect_url_after_logged_in] = nil
      redirect_to url and return
    end

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
