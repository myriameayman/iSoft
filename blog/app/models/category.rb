class Category < ActiveRecord::Base
	has_many :articles, :through => :links
	validates :name, presence: true
end
