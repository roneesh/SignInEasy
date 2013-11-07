class MemberDirectory

  attr_accessor :organization, :employee_list

  def initialize(organization)
    @organization = organization
    @employee_list = Employee.where(organization_id: @organization.id)
  end

end