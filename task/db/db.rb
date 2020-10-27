require "sequel"
require "dotenv"

namespace :db do
  desc "create database"
  task :create do
    Dotenv.load(".env", ".env.local")

    name = ENV["DB_NAME"]
    host = ENV["DB_HOST"]
    user = ENV["DB_USER"]
    password = ENV["DB_PASSWORD"]

    adapter = Sequel.mysql2(
      :host=> host,
      :user=> user,
      :password=> password
    )

    if name.nil?
      puts "ERROR: ENV['DB_NAME'] is nil"
      next
    end

    adapter.run "CREATE DATABASE `#{name}`;"
  end

  desc "migrate database"
  task :migrate do
    Dotenv.load(".env", ".env.local")

    Sequel.extension :migration
    db = Sequel.connect ENV["DATABASE_URL"]

    Sequel::Migrator.apply(db, "db/migrations")
  end

  desc "migrate database"
  task :migrationfile, [:name] => :environment do |_, args|
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    base = "db/migrations"
    name = args[:name]
    file = "#{base}/#{timestamp}_#{name}.rb"

    if name.nil?
      puts "invalid args:\n[USAGE] rake g:migration[name]"
      exit
    end

    content = <<~EOF
      Sequel.migration do
        change do
        end
      end
    EOF

    `
    mkdir -p #{base} &&
    touch #{file} &&
    /bin/echo -n '#{content}' >> #{file}
    `

    puts "created: #{file}"
  end
end
