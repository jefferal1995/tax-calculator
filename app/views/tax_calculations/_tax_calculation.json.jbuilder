json.extract! tax_calculation, :id, :value, :tax_amount, :created_at, :updated_at
json.url tax_calculation_url(tax_calculation, format: :json)
