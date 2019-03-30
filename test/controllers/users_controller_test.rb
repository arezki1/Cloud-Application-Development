require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    
    sign_in(@user)
    get users_show_url
    assert_response :success
  end

end
