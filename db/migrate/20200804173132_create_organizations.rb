class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.boolean :international

      t.timestamps null: false
    end
  end
end
