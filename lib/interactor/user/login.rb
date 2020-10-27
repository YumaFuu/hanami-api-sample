module Interactor
  module User
    class Login
      include ::Interactor::Core
      include ::Interactor::Di

      include import["params", "contract", "user_repo"]

      def call
        user = user_repo.query({ email: params[:email] }, true)

        # is_valid = confirm_password(user, params[:password])
        # if !is_valid
          # @errors = "invalid"
        # end

        jwt = ::JwtIssuer.encode(user[:id])

        @output = {
          token: jwt,
          msg: "success",
        }
      end
    end
  end
end
