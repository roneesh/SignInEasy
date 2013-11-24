class OrganizationsController < ApplicationController

  def show
    @organization = Organization.find_by_id(params[:id])
  end

  def new
    @organization = Organization.new
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def create
    @organization = Organization.new(organization_params)
    respond_to do |format|
      if @organization.save
        flash[:notice] = "#{@organization.name} was created!" 
        format.html { redirect_to admin_show_path}
      else
        flash[:notice] =  "#{@organization.name} not created!"
        format.html { redirect_to admin_show_path}
      end
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
      format.js { render layout: false}
    end
  end

  def update
    @organization = Organization.find_by_id(params[:id])
    
    respond_to do |format|
      if @organization.update_attributes(organization_params)
        format.html { redirect_to admin_show_path, :notice => 'Organization was successfully updated.' }
      else
        format.html { redirect_to admin_show_path, :notice => 'Organization not successfully updated.' }
      end
    end

  end

private
  def organization_params
    params.require(:organization).permit(:name, :admin_id)
  end

end