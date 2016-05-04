class CreateCategorizeProducts < ActiveRecord::Migration
  def change
    create_table :categorize_products do |t|
      t.string :name

      t.timestamps null: true
    end
  end
end
