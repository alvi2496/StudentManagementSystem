require 'test_helper'

class UsersSemestersEnrollmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_semesters_enrollments_index_url
    assert_response :success
  end

  test "should get show" do
    get users_semesters_enrollments_show_url
    assert_response :success
  end

  test "should get new" do
    get users_semesters_enrollments_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_semesters_enrollments_edit_url
    assert_response :success
  end

end
