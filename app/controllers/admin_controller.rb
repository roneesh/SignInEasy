class AdminController < ApplicationController
  def show
    @objects = all_objects
  end

  private

  def administrated_classes
    ['Organization', 'User', 'OrganizationUser', 'Employee', 'ServiceList']
  end

  def all_objects
    array = []
    administrated_classes.each_with_object(array) do |klass, array|
      array << klass.constantize.all
    end
    array
  end
end
