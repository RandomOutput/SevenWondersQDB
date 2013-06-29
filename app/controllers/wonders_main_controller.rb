class WondersMainController < ApplicationController
  def index
  	@users = User.all
  	@quotes = Quote.all
  end
end
