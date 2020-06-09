# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :current_room

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_room
    @current_room ||= Room.opening.find_by(id: session[:room_id])
  end
end
