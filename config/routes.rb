Rails.application.routes.draw do
  devise_for :students
  resources :books do
    member do
      get :borrowed
    end
  end
  root "home#homepage"
  get "home/homepage"
    # get "/borrowed/:id", to:"books#borrowed"
  # root "articles#index"
end
