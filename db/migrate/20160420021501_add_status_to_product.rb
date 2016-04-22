class AddStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products, :status, :boolean, default: true
  end
end
