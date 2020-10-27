module Interactor
  module Core
    def self.included(interactor)
      interactor.class_eval do
        attr_reader :output, :errors

        prepend Validator
      end
    end

    module Validator
      def call
        if valid?
          super
          ::Interactor::Result.new(output: output, errors: errors)
        else
          ::Interactor::Result.new(errors: contract_error)
        end
      end

      private

      def valid?
        contract_error.empty?
      end

      def contract_error
        is_validatable =
          respond_to?(:params) && respond_to?(:contract)

        return {} if !is_validatable

        result = contract.call(params.to_h)
        result.errors.to_h
      end
    end
  end
end
