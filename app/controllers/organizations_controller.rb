class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find_by_id(params[:id])
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

end