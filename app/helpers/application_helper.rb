module ApplicationHelper
	def getApprovals
		if current_user && current_user.admin == true
			#TODO: Proper Value
			2
		else
			0
		end
	end
end
