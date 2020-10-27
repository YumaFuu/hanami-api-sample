module Api
  module Middleware
    class Cors
      def initialize(app)
        @app = app
      end

      def call(env)
        if env["REQUEST_METHOD"] == "OPTIONS"
          return [204, ::Header.cors, []]
        end

        result = @app.call(env)
        result[1] = result[1].merge ::Header.default

        result
      end
    end
  end
end
