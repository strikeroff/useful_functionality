Rails::Generator::Commands::Create.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    logger.route "map.resource #{resource_list}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  map.resource #{resource_list}\n"
      end
    end
  end

  def route_resource_with_options(name, options={})
    sentinel = 'ActionController::Routing::Routes.draw do |map|'

    logger.route "map.resource #{name}#{", "<<options.inspect unless options.blank?}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  map.resource #{","<<options.inspect unless options.blank?}\n"
      end
    end
  end

  def route_name(name, path, route_options = {})
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    
    variable = "map.#{name} '#{path}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"

    variable << ", :requirements => #{route_options[:requirements].inspect}" unless route_options[:requirements].blank?

    logger.route variable
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  #{variable}"
      end
    end
  end

  def insert_into(file, line)
    logger.insert "#{line} into #{file}"
    unless options[:pretend]
      gsub_file file, /^(class|module) .+$/ do |match|
        "#{match}\n  #{line}"
      end
    end
  end
end

Rails::Generator::Commands::Destroy.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    look_for = "\n  map.resource #{resource_list}\n"
    logger.route "map.resource #{resource_list}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{look_for})/mi, ''
    end
  end


  def route_resource_with_options(name, options={})
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    look_for = "\n  map.resource #{name}#{", "<<options.inspect unless options.blank?}\n"
    logger.route look_for
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{look_for})/mi, ''
    end
  end

  def route_name(name, path, route_options = {})
    variable = "map.#{name} '#{path}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
    variable << ", :requirements => #{route_options[:requirements].inspect}" unless route_options[:requirements].blank?

    look_for =   "\n  #{variable}"
    logger.route variable
    unless options[:pretend]
      gsub_file    'config/routes.rb', /(#{look_for})/mi, ''
    end
  end

  def insert_into(file, line)
    logger.remove "#{line} from #{file}"
    unless options[:pretend]
      gsub_file file, "\n  #{line}", ''
    end
  end
end

Rails::Generator::Commands::List.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    logger.route "map.resource #{resource_list}"
  end

  def route_resource_with_options(name, options={})
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    look_for = "\n  map.resource #{name}#{", "<<options.inspect unless options.blank?}\n"
    logger.route  look_for
  end

  def route_name(name, path, options = {})
    variable = "map.#{name} '#{path}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
    variable << ", :requirements => #{route_options[:requirements].inspect}" unless route_options[:requirements].blank?
    variable
  end

  def insert_into(file, line)
    logger.insert "#{line} into #{file}"
  end
end
