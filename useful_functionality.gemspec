# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{useful_functionality}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vesov Ilya"]
  s.date = %q{2009-10-18}
  s.description = %q{useful_functionality }
  s.email = %q{strikeroff@gmail.com}
  s.extra_rdoc_files = ["lib/useful_functionality.rb", "README"]
  s.files = ["init.rb", "lib/useful_functionality.rb", "Manifest", "rails_generators/news_like/news_like_generator.rb", "rails_generators/news_like/templates/migration.rb", "rails_generators/news_like/templates/news_post.rb", "rails_generators/news_like/templates/news_posts_controller.rb", "rails_generators/news_like/templates/news_posts_helper.rb", "rails_generators/news_like/templates/views/index.html.erb", "rails_generators/news_like/templates/views/new.html.erb", "rails_generators/news_like/templates/views/show.html.erb", "Rakefile", "README", "useful_functionality.gemspec"]
  s.homepage = %q{http://7studio.ru}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Useful_functionality", "--main", "README", "-c utf-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{useful_functionality}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{useful_functionality}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
