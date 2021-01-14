class TaxCalculation < ApplicationRecord
  validates :value, presence: true
  validates :tax_amount, presence: true

  belongs_to :user
  belongs_to :tax_rule
end
