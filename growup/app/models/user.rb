class User < ActiveRecord::Base
  attr_accessible :name, :email,:isAdmin,:superAdmin, :password, :password_confirmation,:row_order,:avatar
  attr_accessor :password
  before_save :encrypt_password

   has_attached_file :avatar, :styles => { :small => "150x150>" },
                     :url  => "/assets/images/:id/:style/:basename.:extension",
                     :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"

  # validates_attachment_presence :avatar
  # validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
   
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  include PasswordEncrypt

    # has_many :user_uploads
    # has_many :uploads, through: :user_uploads
    has_and_belongs_to_many :uploads, :join_table => 'user_uploads'


end
