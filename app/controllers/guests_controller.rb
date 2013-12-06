class GuestsController < ApplicationController
  
  layout "visitor_ui", :only => ["new", "show"]
  
  before_action :set_organization

  autocomplete :employee, :name, :full => true

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
    @guest = Guest.new(guest_params)
    @guest.set_id
    if @guest.save
      @guest.run_notification_service if @guest.employee_id
      redirect_to organization_guest_path(@guest.organization_id, @guest.id)
    else
      redirect_to organization_guest_path(@guest.organization_id, @guest.id)
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
  end


  private

  def set_organization
    @organization = Organization.find_by_id(params[:organization_id])
  end

  def guest_params
    params.require(:guest).permit(:name, :email, :company, :reason, :organization_id, :employee_name)
  end


end