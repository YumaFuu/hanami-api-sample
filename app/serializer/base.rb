module Api
  module Serializer
    class Base < Dry::Struct
      def to_json
        JSON.generate(to_h)
      end
    end
  end
end
