class CreateTaxRules < ActiveRecord::Migration[6.0]
  def change
    create_table :tax_rules do |t|
      t.float :min_value
      t.float :max_value
      t.float :percentage
      t.references :user

      t.timestamps
    end
  end
end
