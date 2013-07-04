class AddPrivacyToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :privacy, :string
  end
end
