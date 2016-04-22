class ChangeDescriptionToString < ActiveRecord::Migration
  def change
    change_column :products, :description, :text #product(s) must have "s"
  end
end
