class QuotesController < ApplicationController
  def create
    new_quote = current_user.quotes.build(quote_params)
    new_quote.vote_count = 0
    new_quote.save
    redirect_to :back
  end

  def destroy
    #Vote.where("quote_id = #{params[:id]}").each { |vote| vote.destroy }
    Quote.destroy params[:id]
    redirect_to :back
  end

  def upvote
    if voted?(params[:id]) == false
      quote = Quote.find(params[:id])
      quote.vote_count += 1
      vote = quote.votes.build(user_id: current_user.id)

      if vote.save
        if quote.save
          redirect_to :back
        else
          redirect_to :bacl, :alert => 'Error in quote'
        end
      else
        redirect_to :back, :alert => 'Error in upvote'
      end
    else
      redirect_to :back, :alert => 'Already Voted Up'
    end
  end

  def downvote
    if voted?(params[:id]) == true
      quote = Quote.find(params[:id])
      quote.vote_count -= 1
      vote = quote.votes.find_by_user_id(current_user.id)
      vote.destroy

      if quote.save
        redirect_to :back
      else
        redirect_to :bacl, :alert => 'Error in quote'
      end
    else
      redirect_to :back, :alert => 'Already Voted Down'
    end
  end


  #**********
  private

  def quote_params
      params.
        require(:quote).
        permit(:body, :user_id)
  end
end
