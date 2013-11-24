class ServiceList < ActiveRecord::Base
  belongs_to :organization

  validates :organization_id, uniqueness: true
end
