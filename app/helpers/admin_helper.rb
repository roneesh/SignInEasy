module AdminHelper

def important_columns(object)
  column_names = object.column_names
  column_names - ["created_at", "updated_at"]
end 

def important_attributes(object)
  object.attributes.delete_if { |key, value| key == "created_at" || key == "updated_at"}
end

def delete_url(object)
  "#{object.class.to_s.downcase.pluralize}/#{object.id}"
end

end
