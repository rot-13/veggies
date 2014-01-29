Veggies::Application.routes.draw do

  root 'admin#dashboard'

  resources :veggies, :only => [:update]

  scope :admin, :controller => :admin do
    get :dashboard
  end

end
