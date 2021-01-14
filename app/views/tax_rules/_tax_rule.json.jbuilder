json.extract! tax_rule, :id, :min_value, :max_value, :percentage, :created_at, :updated_at
json.url tax_rule_url(tax_rule, format: :json)
