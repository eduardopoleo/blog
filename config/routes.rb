Rails.application.routes.draw do
  resources :articles
  resources :categories, only: [:new, :create, :show]
  
  resources :articles do
    resources :comments
  end
  
  root 'welcome#front_page'
  get 'welcome', to: 'welcome#front_page', as: 'welcome'
  #Cover_letters
  get 'the_score', to: 'cover_letters#the_score', as: 'the_score'
  get 'stack_builders', to: 'cover_letters#stack_builders', as: 'stack_builders'
  get 'influitive', to: 'cover_letters#influitive', as: 'influitive'
end

