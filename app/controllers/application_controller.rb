# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :current_room

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_room
    # TODO: 時間過ぎたら追い出す仕組みが欲しい
    @current_room ||= Room.opening.find_by(id: session[:room_id])
  end

  def logged_in?
    if current_user
      true
    else
      session[:redirect_url_after_logged_in] = request.fullpath
      redirect_to root_path
      false
    end
  end
end
