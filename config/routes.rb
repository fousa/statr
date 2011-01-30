Statr::Application.routes.draw do
  devise_for :users

  root :to => "dashboard#index"

  resource :dashboard

  resources :categories,   :except => :show
  resources :transactions, :except => :show
end
