require 'test_helper'

class UsersCoursesEnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_courses_enrollments_index_url
    assert_response :success
  end

  test "should get show" do
    get users_courses_enrollments_show_url
    assert_response :success
  end

  test "should get new" do
    get users_courses_enrollments_new_url
    assert_response :success
  end

end
