class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.float :value
      t.integer :quantity
      t.integer :stock

      t.timestamps
    end
  end
end
