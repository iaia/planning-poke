class EstimatesController < ApplicationController
  before_action :check_room

  def create
    @estimate = current_user.estimates.find_by(issue_id: estimate_params[:issue_id])
    @estimate ||= current_user.estimates.create(estimate_params)
    current_issue = @estimate.issue
    if current_issue.estimates.pluck(:user_id).size == current_room.user_count
      body = current_issue.estimates.map do |m|
        "#{m.user.name}: #{m.point}\n"
      end
      ActionCable.server.broadcast(
        'room_channel',
        message: body
      )
    end
  end

  private

  def estimate_params
    params.require(:estimate).permit(:point, :issue_id)
  end

  def check_room
    issue = Issue.find(estimate_params[:issue_id])
    if issue.room != current_room
      raise BadRoom
    end
  end
end

class BadRoom < StandardError; end
