class TaxRule < ApplicationRecord
  validates :min_value, presence: true
  validates :max_value, presence: true
  validates :percentage, presence: true

  belongs_to :user
  has_many :tax_calculations
end
