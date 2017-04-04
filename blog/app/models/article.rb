class Article < ApplicationRecord
	validates :title,:content, presence: true
	has_many :comments
	belongs_to :owner, class_name: "User", foreign_key: :user_id
	def editable_by?(user)
		user == owner
	end
end
