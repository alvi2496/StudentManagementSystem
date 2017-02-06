require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get student" do
    get users_student_url
    assert_response :success
  end

  test "should get admin" do
    get users_admin_url
    assert_response :success
  end

end
