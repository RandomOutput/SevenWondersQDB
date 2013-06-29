class QuotesController < ApplicationController
  def create
    Quote.create(quote_params)
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
        permit(:body, :author)
  end
end
