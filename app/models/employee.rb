class Employee < ActiveRecord::Base

  belongs_to :organization
  has_many :guests

  validates :name, presence: true
  validates :company, presence: true
  validates :email, presence: true, email: true
  validates :organization_id, presence: true
  validates :phone, length: { is: 10 }

end
