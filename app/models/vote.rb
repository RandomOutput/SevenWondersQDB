class Vote < ActiveRecord::Base
	belongs_to :quote
	belongs_to :user

	validates :quote_id, presence: true
end
