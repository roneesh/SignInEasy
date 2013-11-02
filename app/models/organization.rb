class Organization < ActiveRecord::Base
  has_many :organization_users
  has_many :users, :through => :organization_users
  has_many :guests

  def guests
    Guest.where(organization_id: self.id)
  end

end
