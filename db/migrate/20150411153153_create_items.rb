class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :customer_order, index: true
      t.string :product_name
      t.integer :qty
      t.decimal :rate
      t.boolean :received

      t.timestamps null: false
    end
    add_foreign_key :items, :customer_orders
  end
end
