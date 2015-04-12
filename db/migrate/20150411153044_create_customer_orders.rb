class CreateCustomerOrders < ActiveRecord::Migration
  def change
    create_table :customer_orders do |t|
      t.string :order_no
      t.date :order_date
      t.string :customer_name

      t.timestamps null: false
    end
  end
end
