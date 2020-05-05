class IssuesController < ApplicationController
  def create
    @issue = current_room.issues.create(issue_params)
    respond_to do |format|
      format.html
      format.json { render json: @issue }
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:issue_number)
  end
end
