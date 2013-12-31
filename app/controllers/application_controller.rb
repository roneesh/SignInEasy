class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session

  def must_be_signed_in
    unless signed_in?
      redirect_to root_url, notice: "Please sign in."
    end
  end

  def must_be_part_of_organization
    if params[:organization_id] && (params[:organization_id].to_i != current_user.organization.id)
      redirect_to organization_guests_path(current_user.organization.id), notice: "You can't go there!"
    end
  end

end

