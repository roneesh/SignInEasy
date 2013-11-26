class Employee < ActiveRecord::Base

  belongs_to :organization
  has_many :guests

  validates :name, presence: true
  validates :company, presence: true
  validates :email, presence: true
  validates :organization_id, presence: true

end
