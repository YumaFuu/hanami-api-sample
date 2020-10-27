require 'rake'
require 'rack'

desc "load environment"
task :environment do
  # puts "this is environment"
  require "dotenv"
  # require "hanami/model"
  # require "hanami/model/sql"
  # require "./config/initializers/load.rb"

  Dotenv.load(".env", ".env.local")
end

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
  Dir[File.expand_path('../task', __FILE__) << '/**/*.rb'].each(&method(:load))
rescue LoadError
end
