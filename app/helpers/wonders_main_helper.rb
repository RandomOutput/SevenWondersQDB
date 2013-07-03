module WondersMainHelper
	def is_active?(act_string)
		if params[:sort] == act_string || (params[:sort] == nil && act_string == "recent")
			"active"
		else
			""
		end
	end
end
