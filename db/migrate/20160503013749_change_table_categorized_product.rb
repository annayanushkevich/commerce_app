class ChangeTableCategorizedProduct < ActiveRecord::Migration
  def change
    rename_table :categorize_products, :categorized_products
  end
end
