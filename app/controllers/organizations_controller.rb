class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find_by_id(params[:id])
  end

  def new
    @organization = Organization.new
    respond_to do |format|
      format.js
    end
  end

  def destroy
    organization = Organization.find_by_id(params[:id])
    organization.destroy
    redirect_to admin_show_path
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @organization = Organization.find_by_id(params[:id])
    @organization.update_attributes(organization_params)
    redirect_to admin_show_path
  end

private
  def organization_params
    params.require(:organization).permit(:name, :admin_id)
  end

end