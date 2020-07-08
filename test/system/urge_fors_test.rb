require "application_system_test_case"

class UrgeForsTest < ApplicationSystemTestCase
  setup do
    @urge_for = urge_fors(:one)
  end

  test "visiting the index" do
    visit urge_fors_url
    assert_selector "h1", text: "Urge Fors"
  end

  test "creating a Urge for" do
    visit urge_fors_url
    click_on "New Urge For"

    fill_in "Urge", with: @urge_for.urge
    click_on "Create Urge for"

    assert_text "Urge for was successfully created"
    click_on "Back"
  end

  test "updating a Urge for" do
    visit urge_fors_url
    click_on "Edit", match: :first

    fill_in "Urge", with: @urge_for.urge
    click_on "Update Urge for"

    assert_text "Urge for was successfully updated"
    click_on "Back"
  end

  test "destroying a Urge for" do
    visit urge_fors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Urge for was successfully destroyed"
  end
end
