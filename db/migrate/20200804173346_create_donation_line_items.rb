class CreateDonationLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :donation_line_items do |t|
      t.references :donation, index: true
      t.references :organization, index: true

      t.decimal :amount, precision: 18, scale: 2

      t.timestamps
    end
  end
end
