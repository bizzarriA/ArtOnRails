require "application_system_test_case"

class PagamentosTest < ApplicationSystemTestCase
  setup do
    @pagamento = pagamentos(:one)
  end

  test "visiting the index" do
    visit pagamentos_url
    assert_selector "h1", text: "Pagamentos"
  end

  test "creating a Pagamento" do
    visit pagamentos_url
    click_on "New Pagamento"

    click_on "Create Pagamento"

    assert_text "Pagamento was successfully created"
    click_on "Back"
  end

  test "updating a Pagamento" do
    visit pagamentos_url
    click_on "Edit", match: :first

    click_on "Update Pagamento"

    assert_text "Pagamento was successfully updated"
    click_on "Back"
  end

  test "destroying a Pagamento" do
    visit pagamentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pagamento was successfully destroyed"
  end
end
