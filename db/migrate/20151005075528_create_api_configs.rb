class CreateApiConfigs < ActiveRecord::Migration
  def change
    create_table :api_configs do |t|

      t.string :name
      t.string :key
      t.string :secret
      t.string :token
      t.string :token_secret

      t.timestamps null: false
    end
  end
end
