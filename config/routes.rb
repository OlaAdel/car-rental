Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :cars do
    collection do
      get :latest
    end
    resources :cars, only: [:index, :create, :show, :destroy]
  end

  resources :makes, only: [:index, :create]
  resources :models, only: [:index, :create]
  resources :availability_dates, only: [:create]


  resources :reservations do
    collection do
      post :make
    end
  end

end
