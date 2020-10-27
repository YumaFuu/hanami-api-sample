# require "hanami/model/sql"
require "dotenv"
require_relative "./load"
require_relative "./hanami_router"

Dotenv.load(".env", ".env.local")
