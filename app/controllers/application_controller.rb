class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def must_belong_to_organization
    if signed_in? && (params[:organization_id] == current_user.organization.id)
      flash[:notice] = "hi from must_belong_to_organization"
    end
  end

end

