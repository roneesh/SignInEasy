class GuestsController < ApplicationController

  layout "visitor_ui", :only => ["new, show"]
  
  def index
    @guests = Guest.page(params[:page]).per_page(100).order("created_at DESC")
  end

  def new
    @guest = Guest.new
    @organization_id = params[:organization_id]

    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    guest = Guest.new(guest_params)
    guest.set_id
    if guest.save
      guest.run_notification_service if guest.employee_id
      redirect_to organization_guest_path(params[:guest][:organization_id])
    else
      redirect_to organization_guest_path(params[:guest][:organization_id])
    end
  end

  def show
  end



  private

  def guest_params
    params.require(:guest).permit(:name, :email, :company, :reason, :organization_id, :employee_name)
  end


end