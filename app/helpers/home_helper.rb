module HomeHelper
	def has_comments(name)
		if Comment.find_by_name_id(name)
			return true
		else
			return false
		end
	end
end
