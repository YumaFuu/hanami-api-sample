# frozen_string_literal: true

require 'bundler/setup'
require 'hanami/api'
require 'hanami/middleware/body_parser'
require_relative './config/app.rb'
require_relative './routes.rb'

class App < Hanami::API
  use Hanami::Middleware::BodyParser, :json
  use ::Api::Middleware::Cors
  use ::Api::Middlewares::ErrorHandler

  get "/", to: ->_{ [200, {}, ["hello world!"]] }

  scope "v1" do
    scope "user" do
      get "/"
      post "/login"

      # scope "entries" do
      #   get "/"
      #   get "/:id"
      # end
    end
  end
end
