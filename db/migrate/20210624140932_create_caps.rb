class CreateCaps < ActiveRecord::Migration[6.1]
  def change
    create_table :caps do |t|
      t.integer :amount
      t.string :month

      t.timestamps
    end
  end
end
