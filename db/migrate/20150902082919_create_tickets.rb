class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|

      t.string :name
      t.integer :position
      t.belongs_to :column

      t.timestamps null: false
    end
  end
end
