require_relative "./action"

module Routes
  class << self
    def call(env)
      action = routes(
        env['PATH_INFO'],
        :"#{env['REQUEST_METHOD'].downcase}"
      ).new

      Action.new(action).call(env)
    end

    private

    def routes(path, method)
      entrypoint = begin
        case path
        when "/v1/user"
          {
            get: ::Api::Controller::User::Show,
          }
        when "/v1/user/login"
          {
            post: ::Api::Controller::User::Login,
          }
        end
      end

      entrypoint[method]
    end

    def match?(regexp)
      -> given {
        given.match?(regexp)
      }
    end
  end
end
