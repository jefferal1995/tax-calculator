class CreateTaxCalculations < ActiveRecord::Migration[6.0]
  def change
    create_table :tax_calculations do |t|
      t.float :value
      t.float :tax_amount
      t.references :user
      t.references :tax_rule

      t.timestamps
    end
  end
end
