class CreateUserOrganizations < ActiveRecord::Migration
  def change

      create_table :user_organizations do |t|
        t.belongs_to :user, index: true
        t.belongs_to :organization, index: true
        t.integer :creator_id , index: true
      end

  end
end
