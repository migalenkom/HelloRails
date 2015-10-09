class AddSocialUsernameToApiconfigs < ActiveRecord::Migration
  def change
    add_column :api_configs, :social_user_name, :string
  end
end
