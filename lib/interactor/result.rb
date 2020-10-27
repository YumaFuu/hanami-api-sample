module Interactor
  class Result
    attr_reader :output, :errors

    def initialize(output: nil, errors: nil)
      @output = output
      @errors = errors
    end

    def success?
      case @errors
      when NilClass
        true
      when Hash
        @errors.empty?
      end
    end

    def failed?
      !success?
    end
  end
end
