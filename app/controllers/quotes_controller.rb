class QuotesController < ApplicationController
  def create
    new_quote = current_user.quotes.build(quote_params)
    new_quote.vote_count = 0
    new_quote.privacy = "protected"
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

  def set_privacy 
    quote = Quote.find(params[:id])
    if current_user.id == quote.user_id || current_user.admin
      if params[:privacy] == "private"
        quote.privacy = "private"
        quote.save
        #redirect_to :back, :alert => "private"
      elsif params[:privacy] ==  "protected"
        quote.privacy = "protected"
        quote.save
        #redirect_to :back, :alert => "proteted"
      elsif params[:privacy] == "public"
        quote.privacy = "public"
        quote.save
        #redirect_to :back, :alert => "public"
      end
      redirect_to :back
    else
      redirect_to :back, :alert => "Cannot set privacy of other users' posts"
    end
  end

  def set_private
    if !isPrivate?(params[:id])
      quote = Quote.find(params[:id])
      quote.privacy = "private"
      quote.save
    end

    redirect_to :back
  end

  def set_public 
    if isPrivate?(params[:id])
      quote = Quote.find(params[:id])
      quote.privacy = "public"
      quote.save
    end

    redirect_to :back
  end

  #**********
  private

  def quote_params
      params.
        require(:quote).
        permit(:body, :user_id)
  end
end
