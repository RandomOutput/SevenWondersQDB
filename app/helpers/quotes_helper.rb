module QuotesHelper
	def voted?(search_id)
		found = false
		
		Vote.where("quote_id = #{search_id}").each do |vote| 
			if vote.user_id == current_user.id
				found = true
			end
		end
    	
    	return found
  	end
end
