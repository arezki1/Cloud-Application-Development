require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "email validation should trigger" do

    assert_not User.new(username: "username").save
  end

end
