class User < ActiveRecord::Base
  include Clearance::User
  has_many :organization_users
  has_many :organizations, :through => :organization_users

  def managed_spaces
    Organization.where(admin_id: self.id)
  end

  def member_spaces
    self.organizations
  end

  validates_inclusion_of :timezone, in: ActiveSupport::TimeZone.zones_map(&:name)
  
end
