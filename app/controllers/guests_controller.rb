class GuestsController < ApplicationController

  def new
    @guest = Guest.new
  end

  def create
    guest = Guest.new
    guest.name = params[:guest][:name]
    guest.email = params[:guest][:email]

    if guest.save
      redirect_to new_guest_path
    else
      redirect_to new_guest_path
    end
  end

end