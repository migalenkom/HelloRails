class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|

      t.string :name
      t.integer :position
      t.belongs_to :project

      t.timestamps null: false
    end
  end
end
