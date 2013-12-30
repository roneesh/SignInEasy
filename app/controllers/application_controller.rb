class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def belongs_to_organization
    unless signed_in? && params[:organization_id] == current_user.organization.id
      redirect_to organization_guests_path(current_user.organization)
    end
  end

end

