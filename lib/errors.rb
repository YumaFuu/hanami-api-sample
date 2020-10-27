module Error
  class Base < StandardError

    def initialize(errors)
      text = begin
        case errors
        when Hash
          message = errors.map do |k, v|
            Array(v).map { |vi| "#{k} #{vi}" }
          end
          message.flatten * joinner
        when Array
          errors * joinner
        else
          errors
        end
      end

      super text
    end

    private

    def joinner
      ", "
    end
  end

  class BadRequest < Base
  end

  class Unauthorized < Base
  end

  class Forbidden < Base
  end

  class NotFound < Base
  end

  class InternalServer < Base
  end
end
