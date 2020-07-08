require 'test_helper'

class SmokesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smoke = smokes(:one)
  end

  test "should get index" do
    get smokes_url
    assert_response :success
  end

  test "should get new" do
    get new_smoke_url
    assert_response :success
  end

  test "should create smoke" do
    assert_difference('Smoke.count') do
      post smokes_url, params: { smoke: { date: @smoke.date, datetime: @smoke.datetime, notes: @smoke.notes, what: @smoke.what } }
    end

    assert_redirected_to smoke_url(Smoke.last)
  end

  test "should show smoke" do
    get smoke_url(@smoke)
    assert_response :success
  end

  test "should get edit" do
    get edit_smoke_url(@smoke)
    assert_response :success
  end

  test "should update smoke" do
    patch smoke_url(@smoke), params: { smoke: { date: @smoke.date, datetime: @smoke.datetime, notes: @smoke.notes, what: @smoke.what } }
    assert_redirected_to smoke_url(@smoke)
  end

  test "should destroy smoke" do
    assert_difference('Smoke.count', -1) do
      delete smoke_url(@smoke)
    end

    assert_redirected_to smokes_url
  end
end
