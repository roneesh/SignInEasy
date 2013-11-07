class Organization < ActiveRecord::Base
  has_many :organization_users
  has_many :users, :through => :organization_users
  has_many :guests
  has_many :employees
  has_one :service_list

end
