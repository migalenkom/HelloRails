class Organization < ActiveRecord::Base

  scope :my_organizations, -> (current_user) { where(creator_id: current_user) }

  def self.shared_organizations(current_user)
    Organization.where(id:current_user.organizations).where.not(creator_id:current_user)
  end

  has_many :user_organizations
  has_many :users, through: :user_organizations, dependent: :destroy
  has_one  :creator, :class_name => "User", :foreign_key => "creator_id"
  has_many :projects

end
