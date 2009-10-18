class <%= plural_class_name %>Controller < ResourceController::Base

  protect_from_forgery :except=>[:update_attributes]

  create.wants.html do
    redirect_to :action=>"show"
  end

  destroy.wants.html do
    redirect_to :action => "index"
  end
  
end
