require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should get new" do
    get root_url
    assert_response :success
  end



  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should get edit" do
    get root_url(@job)
    assert_response :success
  end

end
