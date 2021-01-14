class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :set_default_ranges

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tax_rules
  has_many :tax_calculations

  def set_default_ranges
    tax_rules.create({ min_value: 0, max_value: 10000, percentage: 0 })
    tax_rules.create({ min_value: 10000, max_value: 20000, percentage: 10 })
    tax_rules.create({ min_value: 20000, max_value: 50000, percentage: 20 })
    tax_rules.create({ min_value: 50000, max_value: nil, percentage: 30 })
  end
end
