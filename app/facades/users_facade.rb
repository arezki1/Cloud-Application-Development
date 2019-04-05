class UsersFacade
attr_reader :user, :jobs

  def initialize(user)
    @users = user
    @jobs = @user.jobs
  end
end
