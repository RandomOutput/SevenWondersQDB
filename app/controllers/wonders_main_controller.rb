class WondersMainController < ApplicationController
	
	def index
		@users = User.all

		case params[:sort]
		when 'top'
			@quotes = Quote.order('vote_count DESC').paginate(page: params[:page], :per_page => 10)
		when 'upvoted'
			@quotes = []
			current_user.votes.each do |vote|
				@quotes.push(vote.quote)
			end
			@quotes = @quotes.paginate(page: params[:page], :per_page => 10)
		when 'mine'
			@quotes = Quote.where("user_id = #{current_user.id}").order('created_at DESC').paginate(page: params[:page], :per_page => 10)
		else
			@quotes = Quote.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
		end
	end
end
