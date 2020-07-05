class EstimatesController < ApplicationController
  before_action :check_room

  def create
    @estimate = Estimate.create_or_find_by_issue_id(
      current_user, params[:issue_id], estimate_params[:point]
    )
    RoomChannel.send_estimates(current_room.id, current_issue)
    if current_issue.estimates.pluck(:user_id).size != current_room.user_count
    else
      current_issue.update!(done: true) # FIXME: false想定
    end
  end

  private

  def estimate_params
    params.require(:estimate).permit(:point)
  end

  def current_issue
    @current_issue ||= Issue.find(params[:issue_id])
  end

  def check_room
    raise BadRoom if current_issue.room != current_room
  end
end

class BadRoom < StandardError; end
class NotCreated < StandardError; end
