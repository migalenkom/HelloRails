class MoveColumnCreatorIdToOrganizations < ActiveRecord::Migration
  def up
    remove_column :user_organizations, :creator_id
    add_column :organizations, :creator_id, :integer
  end

  def down

    add_column :user_organizations, :creator_id, :integer
    remove_column :organizations, :creator_id
  end
end
