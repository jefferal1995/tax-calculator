require 'test_helper'

class TaxCalculationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tax_calculation = tax_calculations(:one)
  end

  test "should get index" do
    get tax_calculations_url
    assert_response :success
  end

  test "should get new" do
    get new_tax_calculation_url
    assert_response :success
  end

  test "should create tax_calculation" do
    assert_difference('TaxCalculation.count') do
      post tax_calculations_url, params: { tax_calculation: {  } }
    end

    assert_redirected_to tax_calculation_url(TaxCalculation.last)
  end

  test "should show tax_calculation" do
    get tax_calculation_url(@tax_calculation)
    assert_response :success
  end

  test "should get edit" do
    get edit_tax_calculation_url(@tax_calculation)
    assert_response :success
  end

  test "should update tax_calculation" do
    patch tax_calculation_url(@tax_calculation), params: { tax_calculation: {  } }
    assert_redirected_to tax_calculation_url(@tax_calculation)
  end

  test "should destroy tax_calculation" do
    assert_difference('TaxCalculation.count', -1) do
      delete tax_calculation_url(@tax_calculation)
    end

    assert_redirected_to tax_calculations_url
  end
end
