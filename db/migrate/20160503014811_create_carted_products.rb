class CreateCartedProducts < ActiveRecord::Migration
  def change
    create_table :carted_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps null: true
    end
  end
end
