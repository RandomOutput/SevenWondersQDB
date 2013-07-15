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

  	def isPrivate?(quote_id)
		quote = Quote.find(quote_id)

		if quote.privacy == "private"
			true
		else
			false
		end
	end

	def isEveryone?(quote_id)
		quote = Quote.find(quote_id)

		if quote.privacy == "public"
			true
		else
			false
		end
	end
end
