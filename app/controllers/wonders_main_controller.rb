class WondersMainController < ApplicationController
	
	def index
		@users = User.all
		@quotes = Quote.order('created_at ASC').paginate(page: params[:page], :per_page => 10)
	end
end
