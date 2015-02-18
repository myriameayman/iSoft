class Category < ActiveRecord::Base
	has_many :articles, :through => :links
end
