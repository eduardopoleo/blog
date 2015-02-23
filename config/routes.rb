Rails.application.routes.draw do
  resources :articles
  
  resources :articles do
    resources :comments
  end
  
  root 'welcome#front_page'
  get 'welcome', to: 'welcome#front_page', as: 'welcome'
end
