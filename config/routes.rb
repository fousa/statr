Statr::Application.routes.draw do
  devise_for :users

  root :to => "dashboard#show"

  resource :dashboard, :controller => "dashboard", :only => :show
  resource :calendar,  :controller => "calendar",  :only => :show

  resources :categories,   :except => :show
  resources :transactions, :except => :show

  match "/calendar/:year/:month" => "calendar#show", :constraints => { :year => /\d{4}/, :month => /\d{2}/ }, :as => :calendar_for_month
end
