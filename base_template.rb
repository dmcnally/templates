# base_template.rb
run "echo TODO > README"

gem "rspec", :version => ">=1.1.99.8"
gem "rspec-rails", :version => ">=1.1.99.8"
gem "aslakhellesoy-cucumber", :version => ">= 1.1.99.21", :source => "http://gems.github.com"
gem "webrat", :version => ">= 0.4.2"
gem "thoughtbot-factory_girl", :lib => "factory_girl",:source => "http://gems.github.com"

plugin "attachment_fu", :git => "git://github.com/technoweenie/attachment_fu.git"
plugin "restful_authentication", :git => "git://github.com/technoweenie/restful-authentication.git"

generate :rspec
generate :authenticated, "user sessions"

git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
.svn
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-m 'initial commit'"


