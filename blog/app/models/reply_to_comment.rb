class ReplyToComment < ActiveRecord::Base
	 belongs_to :comment
	 validates :comment, presence: true
end