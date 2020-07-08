require 'test_helper'

class UrgeForsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urge_for = urge_fors(:one)
  end

  test "should get index" do
    get urge_fors_url
    assert_response :success
  end

  test "should get new" do
    get new_urge_for_url
    assert_response :success
  end

  test "should create urge_for" do
    assert_difference('UrgeFor.count') do
      post urge_fors_url, params: { urge_for: { urge: @urge_for.urge } }
    end

    assert_redirected_to urge_for_url(UrgeFor.last)
  end

  test "should show urge_for" do
    get urge_for_url(@urge_for)
    assert_response :success
  end

  test "should get edit" do
    get edit_urge_for_url(@urge_for)
    assert_response :success
  end

  test "should update urge_for" do
    patch urge_for_url(@urge_for), params: { urge_for: { urge: @urge_for.urge } }
    assert_redirected_to urge_for_url(@urge_for)
  end

  test "should destroy urge_for" do
    assert_difference('UrgeFor.count', -1) do
      delete urge_for_url(@urge_for)
    end

    assert_redirected_to urge_fors_url
  end
end
