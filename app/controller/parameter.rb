class Parameter
  def initialize(env)
    @params = env["router.params"]
  end

  def [](key)
    @params[key.to_sym]
  end

  def to_h
    @params.to_h
  end

  alias :raw :to_h
  alias :get :[]
end
