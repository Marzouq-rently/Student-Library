Rails.application.routes.draw do
  devise_for :students
  resources :books do
    member do
      get :borrowed
    end
  end
  root "home#homepage"
  get "home/header"
  get "home/homepage"
  get "/borrowhistory", to:"books#borrowhistory"
  get "/books/reservation"
  get "/reservationhistory", to:"books#reservationhistory"
  get "books/borrowerror"
  get "books/reserverror"
    # get "/borrowed/:id", to:"books#borrowed"
  # root "articles#index"
end
