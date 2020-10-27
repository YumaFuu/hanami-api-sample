module Api
  module Controller
    class User
      class Login
        include Api::Action

        Interactor = Interactor::User::Login
        Serializer = ::Api::Serializer::User::Login

        def call(params)
          result = Interactor.new(params: params).call

          if result.failed?
            raise ::Error::BadRequest.new(result.errors)
          end

          body = Serializer.new(result.output)
          response(body)
        end
      end
    end
  end
end
