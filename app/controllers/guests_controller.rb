class GuestsController < ApplicationController

  autocomplete :employee, :name, :full => true, :extra_data => [:company], :display_value => :autocomplete_display

  layout "visitor_ui", :only => ["new", "show"]

  before_filter :must_be_signed_in, :must_be_part_of_organization 

  # Scoping the auto-complete to organizaiton_id
  def get_autocomplete_items(parameters)
    items = super(parameters)
    items = items.where(organization_id: params[:organization_id])
  end

  def index

    @organization = Organization.find_by_id(params[:organization_id]) || Organization.find(current_user.organization.id)
    @organization_guests = Guest.where(organization_id: params[:organization_id])
    @guests = @organization_guests.page(params[:page]).per_page(10000).order("created_at DESC")
    @todays_guests = @organization_guests.where("created_at > ? AND created_at < ?", Time.now.in_time_zone.beginning_of_day, Time.now.in_time_zone.end_of_day).order("created_at DESC")
    @yesterdays_guests = @organization_guests.where("created_at > ? AND created_at < ?", (Time.now.in_time_zone - 1.day).beginning_of_day, Time.now.in_time_zone.beginning_of_day).order("created_at DESC")
    @weeks_guests = @organization_guests.where("created_at > ? AND created_at < ?", 7.days.ago.in_time_zone.beginning_of_day, Time.now.in_time_zone.end_of_day).order("created_at DESC")
    @months_guests = @organization_guests.where("created_at > ? AND created_at < ?", Time.now.in_time_zone.beginning_of_month, Time.now.in_time_zone.end_of_day).order("created_at DESC")

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
    # @guest.set_id
    # @guest.employee_name = params[:guest][:employee_name].split(" @ ").first
    
    respond_to do |format|
      if @guest.save
        @guest.run_notification_service if @guest.employee_id
        format.html {redirect_to organization_guest_path(@guest.organization_id, @guest.id)}
        format.json {render json: @guest}
        format.js { render layout: false }
      else
        format.html {redirect_to organization_guest_path(@guest.organization_id, @guest.id)}
        format.json {render json: @guest.errors, status: :unprocessable_entity}
        format.js {render json: @guest.errors}
      end
    end

  end

  def show
    @guest = Guest.find(params[:id])
    @employee = Employee.find_by_id(@guest.employee_id) if @guest.employee_id

    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

  def destroy
    @guest = Guest.find_by_id(params[:id])
    @guest.destroy
    redirect_to organization_guests_path(current_user.organization)
  end

  def login_redirect
    redirect_to organization_guests_path(current_user.organization.id)
  end


  private

  def guest_params
    params.require(:guest).permit(:name, :email, :mobile_number, :company, :reason, :organization_id, :employee_id)
  end

end