class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	has_attached_file :image, styles: { medium: '400x400>'},
										storage: :s3,
										s3_protocol:'https',
										s3_credentials: {
											bucket: 'megblog',
											access_key_id: ENV['S3_ACCESS_KEY'],
											secret_access_key: ENV['S3_SECRET_KEY']
										}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
