class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	has_attached_file :image, styles: { medium: '400x400>'},
										storage: :s3,
										s3_credentials: {
											bucket: 'megblog',
											access_key_id: Rails.application.secrets.s3_access_key,
											secret_access_key: Rails.application.secrets.s3_secret_key
										}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
