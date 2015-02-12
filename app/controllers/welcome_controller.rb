class WelcomeController < ApplicationController
  def front_page
    @articles = Article.last(2)
  end
end
