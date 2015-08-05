class Upload < ActiveRecord::Base
  # attr_accessible :attachment

  # has_many :user_uploads
  # has_many :user, through: :user_uploads
  has_and_belongs_to_many :users, :join_table => 'user_uploads'
  has_attached_file :attachment,:styles => { :small => "350x350>" },
                    :url  => "/assets/images/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"
  validates_attachment_content_type :attachment, :content_type => %w(image/jpeg image/jpg image/png)

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
        "name" => read_attribute(:attachment_file_name),
        "size" => read_attribute(:attachment_file_size),
        "url" => attachment.url(:original),
        "delete_url" => upload_path(self),
        "delete_type" => "DELETE"
    }
  end
end
