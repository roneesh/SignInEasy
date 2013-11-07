class GuestsController < ApplicationController

  def new
    @guest = Guest.new
    @organization_id = params[:organization_id]
  end

  def create
    guest = Guest.new(guest_params)
    if guest.save
      guest.run_notification_service
      redirect_to new_organization_guest_path(params[:guest][:organization_id])
    else
      redirect_to new_organization_guest_path(params[:guest][:organization_id])
    end
  end

  def show

  end

  private

  def guest_params
    params.require(:guest).permit(:name, :email, :organization_id)
  end


end