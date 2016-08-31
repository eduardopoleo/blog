class ArticleSerializer
  include JSONAPI::Serializer

  attribute :title
  attribute :text
end
