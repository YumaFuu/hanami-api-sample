module Repository
  module Base
    def by_pk(id)
      me.
        by_pk(id.to_i).
        one
    end

    def query(cond, uniq = false)
      re = me.
           where(cond)

      uniq ? re.one : re.to_a
    end

    def aggregated(cond, relation, uniq = false)
      re = aggregate(relation).
           where(cond)

      uniq ? re.one : re.to_a
    end

    private

    def me
      send my_table
    end
  end
end
