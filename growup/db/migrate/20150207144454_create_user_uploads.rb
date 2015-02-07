class CreateUserUploads < ActiveRecord::Migration
  def change
    create_table :user_uploads do |t|

      t.timestamps
    end
  end
end
