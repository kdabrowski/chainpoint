class BadgesController < ApplicationController
  def success
    render :success
  end

  def new
    @badge = Badge.new
    render :new
  end

  def create
    new_badge = Badge.new(permitted_params)
    if new_badge.valid?
      new_badge.save
      render :success
    else
      render :submit
    end
  end

  private

  def permitted_params
    params.require(:badge).permit(:badge_issue_date, :recipient_name, :uuid)
  end
end
