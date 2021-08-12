class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.decimal :amount
      t.decimal :fees, precision: 18, scale: 2
      t.boolean :gross_up, default: false
      t.decimal :total_amount, precision: 18, scale: 2

      t.timestamps
    end
  end
end
