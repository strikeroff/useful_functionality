require "generators_helpers/insert_commands.rb"
require "extensions/generator_base.rb"

class ArticleLikeGenerator <  Rails::Generator::Base

  attr_accessor :article_like

  def initialize(runtime_args, runtime_options = {})
    super
    #usage if @args.empty?
    @article_like = @args.first || "article"
  end

  def manifest
    record do |m|
      m.directory "app/models"
      m.directory "app/controllers"
      m.directory "app/views"
      m.directory "lib"


      unless file_exist?("lib/article_methods.rb")
        m.template "article_methods.rb", "lib/article_methods.rb"
      end

      unless file_exist?("app/controllers/articles_controller.rb")
        m.template "articles_controller.rb", "app/controllers/articles_controller.rb"
        m.route_resources :articles
      end

      unless directory_exists?("app/views/articles")
        m.directory "app/views/articles"
      end

      unless file_exist?("app/views/articles/show.html.erb")
        m.template "show.html.erb", "app/views/articles/show.html.erb"
      end

      unless file_exist?("app/models/article.rb")
        m.template "article.rb", "app/models/article.rb"
        m.migration_template "migration.rb", "db/migrate", :migration_file_name => "create_articles"
      end

      unless article_like.blank?

        m.template "show.html.erb", "app/views/articles/#{article_like}.html.erb"

        m.route_name article_like, article_like, :controller => 'articles', :action => 'show',
                     :requirements=>{
                             :alias=>"#{article_like}"
                     }
      end

    end
  end

  def singular_name
    article_like.underscore.singularize
  end

  def plural_name
    article_like.underscore.pluralize
  end

  def singular_class_name
    singular_name.camelize
  end

  def plural_class_name
    plural_name.camelize
  end
end
