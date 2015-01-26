class AddSuperAdmintoUsers < ActiveRecord::Migration
  def change

    add_column :users, :superAdmin, :boolean ,:null => false, :default => false
  end
end
