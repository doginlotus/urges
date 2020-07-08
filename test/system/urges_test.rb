require "application_system_test_case"

class UrgesTest < ApplicationSystemTestCase
  setup do
    @urge = urges(:one)
  end

  test "visiting the index" do
    visit urges_url
    assert_selector "h1", text: "Urges"
  end

  test "creating a Urge" do
    visit urges_url
    click_on "New Urge"

    fill_in "Date", with: @urge.date
    fill_in "Datetime", with: @urge.datetime
    fill_in "Notes", with: @urge.notes
    fill_in "Urge for", with: @urge.urge_for_id
    click_on "Create Urge"

    assert_text "Urge was successfully created"
    click_on "Back"
  end

  test "updating a Urge" do
    visit urges_url
    click_on "Edit", match: :first

    fill_in "Date", with: @urge.date
    fill_in "Datetime", with: @urge.datetime
    fill_in "Notes", with: @urge.notes
    fill_in "Urge for", with: @urge.urge_for_id
    click_on "Update Urge"

    assert_text "Urge was successfully updated"
    click_on "Back"
  end

  test "destroying a Urge" do
    visit urges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Urge was successfully destroyed"
  end
end
