class AddAdminRoleToUsers < ActiveRecord::Migration
  def change

    add_column :users, :isAdmin, :boolean ,:null => false, :default => false
    add_column :users, :name, :string
  end
end
