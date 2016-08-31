module Api
  class ArticlesController < ApplicationController
    def show
      article = Article.find(params[:id])

      render json: ::JSONAPI::Serializer.serialize(article)
    end
  end
end
