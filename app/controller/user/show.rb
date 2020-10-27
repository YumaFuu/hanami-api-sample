module Api
  module Controller
    class User
      class Show
        include Api::Action

        def call(params)
          body = @user.to_h

          response(body)
        end
      end
    end
  end
end
