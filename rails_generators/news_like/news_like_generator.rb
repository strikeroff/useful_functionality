require "generators_helpers/insert_commands.rb"
class NewsLikeGenerator < Rails::Generator::Base

  attr_accessor :news_like,:generator_options

  def initialize(runtime_args, runtime_options = {})
    super
    usage if @args.empty?
    @news_like = @args.first
    @generator_options = @args.second || {}
  end

  def manifest
    record do |m|      
      m.directory "app/models"
      m.directory "app/controllers"
      m.directory "app/helpers"
      m.directory "app/views"
      m.directory "lib"

      m.directory "app/views/#{plural_name}"

      m.template "views/index.html.erb", "app/views/#{plural_name}/index.html.erb"
      m.template "views/show.html.erb", "app/views/#{plural_name}/show.html.erb"
      m.template "views/new.html.erb", "app/views/#{plural_name}/new.html.erb"
      

      m.template "news_post.rb", "app/models/#{singular_name}.rb"
      m.template "news_posts_controller.rb", "app/controllers/#{plural_name}_controller.rb"
      m.template "news_posts_helper.rb", "app/helpers/#{plural_name}_helper.rb"
      m.migration_template "migration.rb", "db/migrate", :migration_file_name => "create_#{plural_name}"

      m.route_resources plural_name

      #m.route_name article_like, article_like, :controller => 'articles', :action => 'articles_show',
      #                  :requirements=>{
      #                          :alias=>"#{article_like}"
      #                  }
      #
      

    end
  end

  def singular_name
    news_like.underscore.singularize
  end

  def plural_name
    news_like.underscore.pluralize
  end

  def singular_class_name
    singular_name.camelize
  end

  def plural_class_name
    plural_name.camelize
  end
end
