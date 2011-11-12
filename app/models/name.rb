class Name < ActiveRecord::Base
	validates_presence_of :name
	validates_uniqueness_of :name

	attr_accessible :name, :votes, :status
	will_paginate @names, :param_name => :names_page
	will_paginate @comments, :param_name => :comments_page

	has_many :comments
end
