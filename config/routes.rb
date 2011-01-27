Statr::Application.routes.draw do
  devise_for :users

  root :to => "dashboard#index"

  resource :dashboard
end
