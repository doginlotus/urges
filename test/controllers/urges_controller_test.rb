require 'test_helper'

class UrgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urge = urges(:one)
  end

  test "should get index" do
    get urges_url
    assert_response :success
  end

  test "should get new" do
    get new_urge_url
    assert_response :success
  end

  test "should create urge" do
    assert_difference('Urge.count') do
      post urges_url, params: { urge: { date: @urge.date, datetime: @urge.datetime, notes: @urge.notes, urge_for_id: @urge.urge_for_id } }
    end

    assert_redirected_to urge_url(Urge.last)
  end

  test "should show urge" do
    get urge_url(@urge)
    assert_response :success
  end

  test "should get edit" do
    get edit_urge_url(@urge)
    assert_response :success
  end

  test "should update urge" do
    patch urge_url(@urge), params: { urge: { date: @urge.date, datetime: @urge.datetime, notes: @urge.notes, urge_for_id: @urge.urge_for_id } }
    assert_redirected_to urge_url(@urge)
  end

  test "should destroy urge" do
    assert_difference('Urge.count', -1) do
      delete urge_url(@urge)
    end

    assert_redirected_to urges_url
  end
end
