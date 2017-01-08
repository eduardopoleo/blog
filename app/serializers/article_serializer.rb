require 'jsonapi-serializers'

class ArticleSerializer
  include JSONAPI::Serializer

  attribute :title
  attribute :text
  has_many :comments
  has_many :categories

  def self_links
    base_url + "articles/#{object.id}"
  end

  def base_url
    "http://localhost:4444"
  end

end
