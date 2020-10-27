class UserRepository < ROM::Repository[:users]
  include ::Repository::Base

  def my_table
    :users
  end
end
