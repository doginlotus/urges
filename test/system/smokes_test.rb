require "application_system_test_case"

class SmokesTest < ApplicationSystemTestCase
  setup do
    @smoke = smokes(:one)
  end

  test "visiting the index" do
    visit smokes_url
    assert_selector "h1", text: "Smokes"
  end

  test "creating a Smoke" do
    visit smokes_url
    click_on "New Smoke"

    fill_in "Date", with: @smoke.date
    fill_in "Datetime", with: @smoke.datetime
    fill_in "Notes", with: @smoke.notes
    fill_in "What", with: @smoke.what
    click_on "Create Smoke"

    assert_text "Smoke was successfully created"
    click_on "Back"
  end

  test "updating a Smoke" do
    visit smokes_url
    click_on "Edit", match: :first

    fill_in "Date", with: @smoke.date
    fill_in "Datetime", with: @smoke.datetime
    fill_in "Notes", with: @smoke.notes
    fill_in "What", with: @smoke.what
    click_on "Update Smoke"

    assert_text "Smoke was successfully updated"
    click_on "Back"
  end

  test "destroying a Smoke" do
    visit smokes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smoke was successfully destroyed"
  end
end
