class EmployeesController < ApplicationController

  def new
    @employee = Employee.new

    respond_to do |format|
      format.js { render layout: false}
    end
  end

  def index
    @employees = Employee.where(organization_id: params[:organization_id])
  end

  def edit
    @organization = current_user.organization
    @employee = set_employee
  end

  def update
    @employee = set_employee

    respond_to do |format|
      if @employee.update_attributes(employee_params)
        format.html { redirect_to organization_employees_path(current_user.organization.id), notice: 'Employee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        flash[:notice] = "#{@employee.name} was created" 
        format.html { redirect_to admin_index_path}
      else
        flash[:notice] = "failed to create employee record"
        format.html { redirect_to admin_index_path}
      end
    end
  end

  def destroy
    @employee = Employee.find_by_id(params[:id])
    @employee.destroy
    redirect_to admin_index_path
  end

  def autocomplete
    @employees = Employee.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @employees.map(&:name)
  end

private
  def employee_params
    params.require(:employee).permit(:name, :company, :email, :phone, :organization_id, :allow_email, :allow_text)
  end

  def set_employee
    Employee.find(params[:id])
  end

end