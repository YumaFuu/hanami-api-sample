module Types # rubocop:disable Metrics/ModuleLength
  include Dry.Types()

  Id = Types::Strict::Integer.constrained(gt: 0).optional
  Name = Types::Strict::String.optional
  Email = Types::Strict::String.optional

  User = Types::Hash.schema(
    id: Id.optional,
    name: Types::Strict::String.optional,
    email: Types::Strict::String.optional,
    age: Types::Integer,
  )
end
