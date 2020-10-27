module Relation
  class Users < ROM::Relation[:sql]
    schema(:jobseekers) do
      attribute :id, Types::Serial
      attribute :name, Types::String
    end

    def by_pk(id)
      where(id: id)
    end
  end
end
