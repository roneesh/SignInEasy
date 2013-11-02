class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find_by_id(params[:id])
  end

end