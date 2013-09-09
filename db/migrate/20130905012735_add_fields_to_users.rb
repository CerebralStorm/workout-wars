class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :admin, :boolean, default: false
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
