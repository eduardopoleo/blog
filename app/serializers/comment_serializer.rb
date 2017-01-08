require 'jsonapi-serializers'

class CommentSerializer
  include JSONAPI::Serializer

  attribute :commenter
  attribute :body

  def self_links
    base_url + "articles/#{object.id}"
  end

  def base_url
    "http://localhost:4444"
  end
end
