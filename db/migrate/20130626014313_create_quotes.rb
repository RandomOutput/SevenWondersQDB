class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
