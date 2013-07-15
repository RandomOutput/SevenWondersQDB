class WondersMainController < ApplicationController
	
	def index
		@users = User.all

		case params[:sort]
		when 'top'
			@quotes = []
			quotes_raw = Quote.order('vote_count DESC')#.paginate(page: params[:page], :per_page => 10)

			quotes_raw.each do |quote|
				if current_user
					if quote.privacy == 'private'
						if current_user.id == quote.id
							@quotes.push quote
						end
					else
						@quotes.push quote
					end
				else
					if quote.privacy == 'public'
						@quotes.push quote
					end
				end
			end
			if @quotes != [] && @quotes != nil
				@quotes = @quotes.paginate(page: params[:page], :per_page => 10)
			end
		when 'upvoted'
			@quotes = []
			current_user.votes.each do |vote|
				@quotes.push(vote.quote)
			end
			@quotes = @quotes.paginate(page: params[:page], :per_page => 10)
		when 'mine'
			@quotes = Quote.where("user_id = #{current_user.id}").order('created_at DESC').paginate(page: params[:page], :per_page => 10)
		else
			@quotes = []
			quotes_raw = Quote.order('created_at DESC').paginate(page: params[:page], :per_page => 10)

			quotes_raw.each do |quote|
				if current_user
					if quote.privacy == 'private'
						if current_user.id == quote.id
							@quotes.push quote
						end
					else
						@quotes.push quote
					end
				else
					if quote.privacy == 'public'
						@quotes.push quote
					end
				end
			end
			if @quotes != [] && @quotes != nil
				@quotes = @quotes.paginate(page: params[:page], :per_page => 10)
			end
		end
	end
end
