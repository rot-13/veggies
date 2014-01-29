Veggies::Application.routes.draw do

  root 'veggies#salad'

  scope :admin, :controller => :admin do
    get :dashboard
  end

end
