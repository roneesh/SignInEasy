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

end

