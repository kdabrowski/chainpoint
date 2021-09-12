class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  def resource_not_found
    render file: "#{Rails.root}/app/views/404.html", status: 404
  end
end
