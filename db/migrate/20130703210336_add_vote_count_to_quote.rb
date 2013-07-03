class AddVoteCountToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :vote_count, :integer
  end
end
