class TaxRule < ApplicationRecord
  validates :min_value, presence: true
  validates :percentage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  belongs_to :user
  has_many :tax_calculations
end
