class MemberDirectoriesController < ApplicationController

  def show
    organization = Organization.find_by_id(params[:organization_id])
    @member_directory = MemberDirectory.new(organization)
  end

end