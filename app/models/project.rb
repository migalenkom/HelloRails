class Project < ActiveRecord::Base


  belongs_to :organization
  has_many :columns, dependent: :destroy

end
