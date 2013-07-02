class QuotesController < ApplicationController
  def create
    new_quote = current_user.quotes.build(quote_params)
    #new_quote.author = current_user.id
    new_quote.save
    redirect_to root_path
  end

  def destroy
    Quote.destroy params[:id]
    redirect_to :back, :notice => 'Quote has been deleted'
  end

  #**********
  private

  def quote_params
      params.
        require(:quote).
        permit(:body, :user_id)
  end
end
