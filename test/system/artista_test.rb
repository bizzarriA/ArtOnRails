require "application_system_test_case"

class ArtistaTest < ApplicationSystemTestCase
  setup do
    @artistum = artista(:one)
  end

  test "visiting the index" do
    visit artista_url
    assert_selector "h1", text: "Artista"
  end

  test "creating a Artistum" do
    visit artista_url
    click_on "New Artistum"

    click_on "Create Artistum"

    assert_text "Artistum was successfully created"
    click_on "Back"
  end

  test "updating a Artistum" do
    visit artista_url
    click_on "Edit", match: :first

    click_on "Update Artistum"

    assert_text "Artistum was successfully updated"
    click_on "Back"
  end

  test "destroying a Artistum" do
    visit artista_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Artistum was successfully destroyed"
  end
end
