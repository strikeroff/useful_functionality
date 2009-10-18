# Rakefile
require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('useful_functionality', '0.1.0') do |p|
  p.description    = "useful_functionality "
  p.url            = "http://7studio.ru"
  p.author         = "Vesov Ilya"
  p.email          = "strikeroff@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*",".svn",".git"]
  p.runtime_dependencies = ['nifty-generators']
  p.need_tar_gz =     false
  p.retain_gemspec =  true
  p.gemspec_name =    'useful_functionality.gemspec'
  p.test_pattern =    ["test/**/*_test.rb"]
  p.rdoc_pattern =    ["README", "CHANGELOG", "lib/**/*.rb"]
  p.rdoc_options <<   "-c utf-8"
  p.ignore_pattern =  [".gitignore", "doc", ".idea",  "*.bat","*.sh"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
