module Container
  module User
    class Login
      extend Dry::Container::Mixin

      register "params"

      register "user_repo" do
        UserRepository.new(DB::Rom)
      end

      register "contract" do
        ::Contract::User::Login.new
      end
    end
  end
end
