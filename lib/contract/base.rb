module Contract
  class Base < Dry::Validation::Contract
    register_macro(:email_format) do
      unless /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.match?(value)
        key.failure("is not a valid format")
      end
    end
  end
end
