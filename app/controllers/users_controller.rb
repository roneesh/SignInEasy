class UsersController < Clearance::UsersController

  def show
    @user = current_user
    @managed_spaces = Organization.where(admin_id: current_user.id)
    @member_spaces = @user.organizations
  end

end