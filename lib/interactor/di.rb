module Interactor
  module Di
    def self.included(interactor)
      container = interactor.name.sub("Interactor", "Container")

      interactor.define_singleton_method(:import) do
        ::Dry::AutoInject(eval container)
      end
    end
  end
end
