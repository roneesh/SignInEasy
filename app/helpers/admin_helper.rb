module AdminHelper

  def important_columns(object)
    column_names = object.column_names
    column_names - ["id", "created_at", "updated_at", "encrypted_password", "confirmation_token", "remember_token"]
  end 

  def important_attributes(object)
    not_important_columns = ["id","created_at", "updated_at", "encrypted_password", "confirmation_token", "remember_token"]
    object.attributes.delete_if { |key, value| not_important_columns.include?(key)}
  end

  def asset_url(object)
    "#{object.class.to_s.downcase.pluralize}/#{object.id}"
  end

  def new_asset_url(object)
    "#{object.model.to_s.downcase}/new"
  end
s
  def edit_asset_url(object)
    "#{object.model.to_s.downcase}_path"
  end

end
