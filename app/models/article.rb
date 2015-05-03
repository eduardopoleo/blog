class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :article_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true
end
