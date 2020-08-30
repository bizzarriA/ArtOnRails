require "application_system_test_case"

class OperasTest < ApplicationSystemTestCase
  setup do
    @opera = operas(:one)
  end

  test "visiting the index" do
    visit operas_url
    assert_selector "h1", text: "Operas"
  end

  test "creating a Opera" do
    visit operas_url
    click_on "New Opera"

    click_on "Create Opera"

    assert_text "Opera was successfully created"
    click_on "Back"
  end

  test "updating a Opera" do
    visit operas_url
    click_on "Edit", match: :first

    click_on "Update Opera"

    assert_text "Opera was successfully updated"
    click_on "Back"
  end

  test "destroying a Opera" do
    visit operas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Opera was successfully destroyed"
  end
end
