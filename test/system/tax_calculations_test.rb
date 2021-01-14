require "application_system_test_case"

class TaxCalculationsTest < ApplicationSystemTestCase
  setup do
    @tax_calculation = tax_calculations(:one)
  end

  test "visiting the index" do
    visit tax_calculations_url
    assert_selector "h1", text: "Tax Calculations"
  end

  test "creating a Tax calculation" do
    visit tax_calculations_url
    click_on "New Tax Calculation"

    click_on "Create Tax calculation"

    assert_text "Tax calculation was successfully created"
    click_on "Back"
  end

  test "updating a Tax calculation" do
    visit tax_calculations_url
    click_on "Edit", match: :first

    click_on "Update Tax calculation"

    assert_text "Tax calculation was successfully updated"
    click_on "Back"
  end

  test "destroying a Tax calculation" do
    visit tax_calculations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tax calculation was successfully destroyed"
  end
end
