class User < ActiveRecord::Base
  include Clearance::User
  has_one :organization_user
  has_one :organization, :through => :organization_user

  def managed_spaces
    Organization.where(admin_id: self.id)
  end

  def member_spaces
    self.organizations
  end
  
end
