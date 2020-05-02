class EstimatesController < ApplicationController
  before_action :check_room

  def create
    @estimate = current_user.estimates.create(estimate_params)
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
