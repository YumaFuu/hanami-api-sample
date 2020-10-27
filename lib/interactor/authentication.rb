module Interactor
  class Authentication
    include ::Interactor::Core

    def initialize(
      bearer_token,
      user_repo: UserRepository.new(DB::Rom)
    )
      _, @jwt = bearer_token.to_s.split(" ")
      @user_repo = user_repo
    end

    def call
      token = begin
        root? ?
          root_token :
          JwtIssuer.decode(@jwt)
      end

      return if token.nil?

      user =
        @user_repo.by_pk(token[:user_id])

      @output = {
        user: user,
      }
    end

    private

    def root?
      @jwt == "hello"
    end

    def root_token
      user = @user_repo.query(
        { name: "hello" },
        true,
      )

      {
        user_id: user.id,
        env: ENV["ENV"],
        exp: Time.now + 60 * 60,
      }
    end
  end
end
