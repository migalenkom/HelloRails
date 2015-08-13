class User < ActiveRecord::Base
  # attr_accessible :name, :email,:isAdmin,:superAdmin, :password, :password_confirmation,:row_order,:avatar
  attr_accessor :password
  before_save :encrypt_password

   has_attached_file :avatar, :styles => { :small => "150x150>" },
                     :url  => "/assets/images/:id/:style/:basename.:extension",
                     :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"


  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
   
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  include PasswordEncrypt

  has_and_belongs_to_many :uploads, :join_table => 'user_uploads'
  has_many :user_organizations
  has_many :organizations, through: :user_organizations
  has_many :created_organizations, :class_name => "Organization", :foreign_key => "creator_id"

end