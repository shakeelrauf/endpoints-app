Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :endpoints, only: [:create, :index, :update, :destroy], :defaults => { :format => 'json' }
  get "/404" => "errors#not_found"
end
