class UsersController < Clearance::UsersController

  def show
    @user = current_user
  end

end