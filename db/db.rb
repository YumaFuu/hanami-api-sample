class DB
  url = ENV["DATABASE_URL"]

  Rom = ROM.container(:sql, url) do |config|
    config.register_relation(Relation::Users)
    config.relation(:users) do
      schema(infer: true)
      auto_struct true
    end
  end
end
