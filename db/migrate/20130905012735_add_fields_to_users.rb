class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :admin, :boolean, default: false
  end
end
