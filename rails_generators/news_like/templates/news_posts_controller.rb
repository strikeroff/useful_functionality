class <%= plural_class_name %>Controller < ResourceController::Base

  protect_from_forgery :except=>[:update_attributes]
end
