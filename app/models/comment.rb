class Comment < ActiveRecord::Base
	belongs_to :post
	validates_presence_of :name, :message => " is required."
	validates_presence_of :email, :message => " is required (will not be published)."
	validates_presence_of :body, :message => " of comment is required."
end
