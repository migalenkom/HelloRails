class AddPositionToUsers < ActiveRecord::Migration
   def change

   add_column :users, :row_order, :integer ,:null => true, :default => nil
   end



end
