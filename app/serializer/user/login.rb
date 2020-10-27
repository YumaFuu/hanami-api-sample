module Api
  module Serializer
    module User
      class Login < Api::Serializer::Base
        attribute :token, Types::String
        attribute :msg, Types::String
      end
    end
  end
end
