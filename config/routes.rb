Rails.application.routes.draw do
  resources :articles
  resources :categories, only: [:new, :create, :show]

  resources :articles do
    resources :comments
  end

  root 'welcome#front_page'
  get 'welcome', to: 'welcome#front_page', as: 'welcome'
  #Cover_letters
  get 'influitive', to: 'cover_letters#influitive', as: 'influitive'
  get 'info_tech', to: 'cover_letters#info_tech', as: 'info_tech'

  scope '/api', module: :api do
    resources :articles, only: [:show]
  end
end
