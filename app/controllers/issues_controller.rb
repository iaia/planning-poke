class IssuesController < ApplicationController
  def create
    @issue = current_room.issues.create(issue_params)
  end

  private

  def issue_params
    params.require(:issue).permit(:issue_number)
  end
end
