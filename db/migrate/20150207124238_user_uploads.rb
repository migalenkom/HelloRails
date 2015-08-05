class UserUploads < ActiveRecord::Migration
 def change

   create_table :user_uploads do |t|

     t.belongs_to :user, index: true
     t.belongs_to :upload, index: true

   end

 end
end
