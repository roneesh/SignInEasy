class Guest < ActiveRecord::Base
  belongs_to :organization
  belongs_to :employee

  attr_accessor :employee_name

  validates_presence_of :name
  before_create :downcase_email_address


  def initialize(params = {})
    @employee_name = params[:employee_name] || nil
    super #without super guest won't initialize
  end

  def run_notification_service
    notification = Notification.new(self)
    notification.send
    self.email_notification_status = notification.email_status
    self.text_notification_status = notification.text_status
    # puts "status: '#{email_notification_status}' was saved from guest.rb" if save
    save
  end

  def set_id
    self.employee_id = employee
  end

  def employee
    Employee.find_by_name(@employee_name).try(:id)
  end 

  # downcases addresses to prevent duplicate entires
  def downcase_email_address
    self.email = self.email.downcase 
  end

  def employee_name
    employee.try(:name)
  end

  def employee_name=(name)
    self.employee = Employee.find_or_create_by_name(name) if name.present?
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |guest|
        csv << guest.attributes.values_at(*column_names)
      end
    end
  end

end