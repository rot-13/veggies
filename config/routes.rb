Veggies::Application.routes.draw do

  root 'admin#dashboard'

  resources :veggies, :only => [:update]
  resources :twitter_accounts

  scope :admin, :controller => :admin do
    get :dashboard
  end

  get "/auth/:provider/callback" => "auth#callback"
end
