require 'test_helper'

class TaxRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tax_rule = tax_rules(:one)
  end

  test "should get index" do
    get tax_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_tax_rule_url
    assert_response :success
  end

  test "should create tax_rule" do
    assert_difference('TaxRule.count') do
      post tax_rules_url, params: { tax_rule: {  } }
    end

    assert_redirected_to tax_rule_url(TaxRule.last)
  end

  test "should show tax_rule" do
    get tax_rule_url(@tax_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_tax_rule_url(@tax_rule)
    assert_response :success
  end

  test "should update tax_rule" do
    patch tax_rule_url(@tax_rule), params: { tax_rule: {  } }
    assert_redirected_to tax_rule_url(@tax_rule)
  end

  test "should destroy tax_rule" do
    assert_difference('TaxRule.count', -1) do
      delete tax_rule_url(@tax_rule)
    end

    assert_redirected_to tax_rules_url
  end
end
