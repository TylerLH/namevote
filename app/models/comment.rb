class Comment < ActiveRecord::Base
	validates_presence_of :commenter
	validates_presence_of :body

	belongs_to :name
end
