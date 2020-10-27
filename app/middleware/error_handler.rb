module Api
  module Middlewares
    class ErrorHandler
      def initialize(app)
        @app = app
      end

      def call(env)
        begin
          @app.call(env)
        rescue => e
          puts e.message
          # puts e.backtrace
          case e
          when ::Error::BadRequest
            apierr(400, e)
          when ::Error::Unauthorized
            apierr(401, e)
          when ::Error::Forbidden
            apierr(403, e)
          when ::Error::NotFound
            apierr(404, e)
          when ::Error::InternalServer
            apierr(500, e)
          when StandardError
            unexpect500(e)
          end
        end
      end

      private

      def apierr(status, err)
        [status, {}, StringIO.new(resp(err))]
      end

      def unexpect500(err)
        [500, {}, StringIO.new(resp(err))]
      end

      def resp(err)
        body = {
          error_type: err.class.name,
          error_message: err.message,
        }

        body[:backtrace] = err.backtrace # if %w(dev local).include? ENV["ENV"]

        body.to_json
      end
    end
  end
end
