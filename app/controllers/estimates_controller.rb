class EstimatesController < ApplicationController
  before_action :check_room

  def create
    @estimate = Estimate.create_or_find_by_issue_id(current_user, estimate_params)
    current_issue = @estimate.issue
    return if current_issue.estimates.pluck(:user_id).size != current_room.user_count

    RoomChannel.send_message(current_issue)
  end

  private

  def estimate_params
    params.require(:estimate).permit(:point, :issue_id)
  end

  def check_room
    issue = Issue.find(estimate_params[:issue_id])
    raise BadRoom if issue.room != current_room
  end
end

class BadRoom < StandardError; end
