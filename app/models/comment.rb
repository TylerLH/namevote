class Comment < ActiveRecord::Base
	validates_presence_of :commenter
	validates_presence_of :body
	validates_presence_of :name_id

	belongs_to :name
end
