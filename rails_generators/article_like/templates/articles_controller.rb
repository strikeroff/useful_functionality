class ArticlesController < ResourceController::Base
  protect_from_forgery :except=>[:update_attribute]
  include ArticleMethods  
end
