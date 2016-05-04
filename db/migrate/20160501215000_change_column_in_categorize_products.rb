class ChangeColumnInCategorizeProducts < ActiveRecord::Migration
  def change
    remove_column :categorize_products, :name, :string
    add_column :categorize_products, :product_id, :integer
    add_column :categorize_products, :category_id, :integer
  end
end
