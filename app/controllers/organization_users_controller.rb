class OrganizationUsersController < ApplicationController

  def new
    @organization_user = OrganizationUser.new

    respond_to do |format|
      format.js { render layout: false }
    end 

  end

  def create
    @organization_user = OrganizationUser.new(organization_user_params)

    respond_to do |format|
      if @organization_user.save
        flash[:notice] = "#{@organization_user.user} was added to #{@organization_user.organization}!" 
        format.html { redirect_to admin_show_path}
      else
        flash[:notice] = "#{@organization_user.user} was not added to #{@organization_user.organization}!"
        format.html { redirect_to admin_show_path}
      end
    end

  end

  def destroy
    organization_user = OrganizationUser.find_by_id(params[:id])
    organization_user.destroy
    redirect_to admin_show_path
  end

private
  def organization_user_params
    params.require(:organization_user).permit(:user_id, :organization_id)
  end

end