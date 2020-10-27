module Contract
  module User
    class Login < Contract::Base
      params do
        required(:email).value(:string)
        required(:password).value(:string)
      end

      rule(:email).validate(:email_format)
    end
  end
end
