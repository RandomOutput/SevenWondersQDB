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

	validates :user_id, presence: true
end
