class AdminController < ApplicationController
  
  before_filter :must_be_signed_in


  def index
    @objects = all_objects
  end

  private

  def administrated_classes
    ['Organization', 'User', 'OrganizationUser', 'Employee', 'ServiceList']
  end

  def all_objects
    administrated_classes.each_with_object([]) do |klass, array|
      array << (klass.constantize).all
    end
  end
end
