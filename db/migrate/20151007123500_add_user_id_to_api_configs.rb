class AddUserIdToApiConfigs < ActiveRecord::Migration
  def change
    add_reference :api_configs, :user
  end
end
