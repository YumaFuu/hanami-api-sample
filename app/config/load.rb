# frozen_string_literal: true

require "dry-types"
require "dry-struct"
require "dry-container"
require "dry-auto_inject"
require "dry-validation"
require "dotenv"
require "rom"
require "rom-sql"
require "pry"

dirs = [
  "lib/relation/**/*.rb",
  "db/**/*.rb",
  "lib/container/**/*.rb",
  "lib/contract/*.rb",
  "lib/contract/**/*.rb",
  "lib/repository/base.rb",
  "lib/repository/**/*.rb",
  "lib/interactor/*.rb",
  "lib/interactor/**/*.rb",
  "lib/entity/**/*.rb",
  "lib/**/*.rb",
  "app/serializer/*.rb",
  "app/serializer/**/*.rb",
  "app/controller/router.rb",
  "app/controller/action.rb",
  "app/controller/**/*.rb",
  "app/middleware/**/*.rb",
]

Dotenv.load(".env", ".env.local")

dirs.each do |dir|
  path = "#{Rack::Directory.new("").root}/#{dir}"
  Dir[path].each(&method(:require))
end
