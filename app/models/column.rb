class Column < ActiveRecord::Base

  belongs_to :project
  has_many :tickets, dependent: :destroy

end
