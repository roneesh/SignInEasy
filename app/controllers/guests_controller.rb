class GuestsController < ApplicationController

  autocomplete :employee, :name, :full => true

  layout "visitor_ui", :only => ["new", "show"]



  def index

    #page(params[:page]).per_page(100).order("created_at DESC") pagination code

    @guests = Guest.all
    @todays_guests = Guest.where("created_at > ? AND created_at < ?", Time.now.in_time_zone.beginning_of_day, Time.now.in_time_zone.end_of_day).order("created_at DESC")
    @yesterdays_guests = Guest.where("created_at > ? AND created_at < ?", (Time.now.in_time_zone - 1.day).beginning_of_day, Time.now.in_time_zone.beginning_of_day).order("created_at DESC")
    @weeks_guests = Guest.where("created_at > ? AND created_at < ?", 7.days.ago.in_time_zone.beginning_of_day, Time.now.in_time_zone.end_of_day).order("created_at DESC")
    @months_guests = Guest.where("created_at > ? AND created_at < ?", Time.now.in_time_zone.beginning_of_month, Time.now.in_time_zone.end_of_day).order("created_at DESC")

    respond_to do |format|
      format.html
      format.csv { send_data @guests.to_csv }
    end

  end

  def new
    @guest = Guest.new
    @organization_id = params[:organization_id]

    respond_to do |format|
      format.js
      format.html
      format.json
    end
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.set_id
    @guest.employee_name = params[:employee_name]
    if @guest.save
      @guest.run_notification_service if @guest.employee_id
      redirect_to organization_guest_path(@guest.organization_id, @guest.id)
    else
      redirect_to organization_guest_path(@guest.organization_id, @guest.id)
    end
  end

  def show
    @guest = Guest.find(params[:id])
    @employee = Employee.find_by_id(@guest.employee_id) if @guest.employee_id
  end

  def destroy
    @guest = Guest.find_by_id(params[:id])
    @guest.destroy
    redirect_to organization_guests_path(current_user.organization)
  end


  private

  def guest_params
    params.require(:guest).permit(:name, :email, :mobile_number, :company, :reason, :organization_id, :employee_name)
  end


end