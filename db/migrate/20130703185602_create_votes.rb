class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :quote_id

      t.timestamps
    end
    add_index :votes, :quote_id
  end
end
