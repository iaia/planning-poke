class IssuesController < ApplicationController
  def index
    @issues = current_room.issues
      .doing
      .left_joins(estimates: :user)
      .order(id: :desc)
    @issues += current_room.issues
      .done
      .distinct
      .left_joins(estimates: :user)
      .order(id: :desc)
    respond_to do |format|
      format.json { render json: @issues, include: { estimates: :user } }
    end
  end

  def create
    @issue = current_room.issues.create(issue_params)
    RoomChannel.notify_new_issue(current_room.id)
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
