# == Schema Information
#
# Table name: quotes
#
#  id         :integer          not null, primary key
#  author     :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Quote < ActiveRecord::Base
	belongs_to :user
	has_many :votes, dependent: :destroy

	validates :user_id, presence: true
	validates :vote_count, presence: true
end
