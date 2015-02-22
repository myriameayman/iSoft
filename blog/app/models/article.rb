class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :categories, :through => :links
  validates :title, presence: true,
                    length: { minimum: 5 }
  belongs_to :user
end