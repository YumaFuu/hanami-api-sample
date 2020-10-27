require_relative "../routes.rb"

class Hanami::Router
  alias_method :__get__, :get
  alias_method :__post__, :post

  def get(path, option = nil, &blk)
    option ||= { to: ::Routes }
    __get__(path, option, &blk)
  end

  def post(path, option = nil, &blk)
    option ||= { to: ::Routes }
    __post__(path, option, &blk)
  end
end
