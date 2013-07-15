module ApplicationHelper
	def get_approvals
		if current_user && current_user.admin == true
			User.where("approved = false").order('created_at DESC')
		else
			nil
		end
	end

	def approval_count
		if current_user && current_user.admin == true
			User.where("approved = false").order('created_at DESC').count
		else
			0
		end
	end

end
