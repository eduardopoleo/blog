class CategorySerializer
  include JSONAPI::Serializer

  attribute :name

  def base_url
    "http://localhost:4444"
  end
end
