require "application_system_test_case"

class TaxRulesTest < ApplicationSystemTestCase
  setup do
    @tax_rule = tax_rules(:one)
  end

  test "visiting the index" do
    visit tax_rules_url
    assert_selector "h1", text: "Tax Rules"
  end

  test "creating a Tax rule" do
    visit tax_rules_url
    click_on "New Tax Rule"

    click_on "Create Tax rule"

    assert_text "Tax rule was successfully created"
    click_on "Back"
  end

  test "updating a Tax rule" do
    visit tax_rules_url
    click_on "Edit", match: :first

    click_on "Update Tax rule"

    assert_text "Tax rule was successfully updated"
    click_on "Back"
  end

  test "destroying a Tax rule" do
    visit tax_rules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tax rule was successfully destroyed"
  end
end
