Rails.application.routes.draw do
  devise_for :users
  root 'application#test'
  get '/', to: 'application#test'
  post 'subreddits/search', to: 'subreddits#search'
  resources :subreddits
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
