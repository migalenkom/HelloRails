class User < ActiveRecord::Base
   attr_accessible :name, :email,:isAdmin,:superAdmin, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  include PasswordEncrypt

end
