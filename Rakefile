# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :migrations do
  puts "migrating databses..."
  system('rake db:migrate && rake db:migrate RAILS_ENV=test')
end

task :drop do
  puts "dropping database..."
  system("rake db:drop && rm db/schema.rb")
end
