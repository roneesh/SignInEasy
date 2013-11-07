class Employee < ActiveRecord::Base

  belongs_to :organization
  has_many :guests

end
