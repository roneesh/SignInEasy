class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find_by_id(params[:id])
    @guests = Guest.where(organization_id: @organization.id)
  end

end