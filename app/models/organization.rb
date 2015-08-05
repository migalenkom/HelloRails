class Organization < ActiveRecord::Base

  has_many :user_organizations
  has_many :users, through: :user_organizations, dependent: :destroy
  has_one  :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :projects

end
