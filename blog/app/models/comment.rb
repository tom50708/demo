class Comment < ApplicationRecord
	belongs_to :article
	validates :content, presence: true
	belongs_to :author, class_name: "User", foreign_key: :user_id
	def editable_by?(user)
		user == author
	end
end
