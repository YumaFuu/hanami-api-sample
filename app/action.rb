class Action
  def initialize(action)
    @action = action
  end

  def call(env)
    params = ::Parameter.new(env)
    jwt = env['HTTP_AUTHORIZATION']

    result = ::Interactor::Authentication.new(jwt).call
    @user = result.output.to_h[:user]

    case @action.class
    when login_action? then allow_all_user
    else allow_logged_in_user
    end

    @action.instance_variable_set(
      :@user,
      @user
    )

    @action.call(params)
  end

  private

  def login_action?
    actions = [
      Api::Controller::User::Login
    ]

    ->(action) { actions.include? action }
  end

  def allow_all_user; end

  def allow_logged_in_user
    raise ::Error::Unauthorized, 'not logged in' if @user.nil?
  end
end
