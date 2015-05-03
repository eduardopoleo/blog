Rails.application.routes.draw do
  resources :articles
  resources :categories, only: [:new, :create, :show]
  
  resources :articles do
    resources :comments
  end
  
  root 'welcome#front_page'
  get 'welcome', to: 'welcome#front_page', as: 'welcome'
  get 'the_score', to: 'cover_letters#the_score', as: 'the_score'
end
