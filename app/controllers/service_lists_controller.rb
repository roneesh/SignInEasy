class ServiceListsController < ApplicationController

  def new
    @service_list = ServiceList.new

    respond_to do |format|
      format.js { render layout: false}
    end
  end

  def create
    @service_list = ServiceList.new(service_list_params)

    respond_to do |format|
      if @service_list.save 
        flash[:notice] = "#{@service_list.organization.name} permissions updated"
        format.html {redirect_to admin_index_path}
      else 
        flash[:notice] = "permissions not updated"
        format.html {redirect_to admin_index_path}
      end
    end

  end 

  def destroy
    service_list = ServiceList.find_by_id(params[:id])
    service_list.destroy
    redirect_to admin_index_path
  end

private
 
  def service_list_params
    params.require(:service_list).permit(:organization_id, :email_notification, :text_notification)
  end


end