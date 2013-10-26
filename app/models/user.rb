class User < ActiveRecord::Base
  include Clearance::User
  has_many :organization_users
  has_many :organizations, :through => :organization_users
end
