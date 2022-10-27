Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students, controllers: {
    sessions: 'students/sessions'
  }
  namespace :api do
    resources :admins, only: %i[create]
    resources :borrows
    resources :books
    resources :users
  end
  resources :books do
      member do
        get :borrowed
      end
  end
  resources :userss do
    member do
      # get :return
      get :status
    end
  end
  resources :borrows do
    member do
      get :create
      put :update
    end
  end
  resources :reservations do
    member do
      put :update
    end
  end
  resources :pictures do
    member do
      get :addbookphoto
    end
  end
  root "users#users"
  # root "home#homepage"
  get "home/header"
  get "home/header1"
  get "home/homepage"
  get "/homepage", to:"home#homepage"
  get "/borrowhistory", to:"books#borrowhistory"
  get "/books/reservation"
  get "/reservationhistory", to:"books#reservationhistory"
  get "books/borrowerror"
  get "books/reserverror"
  get "/addprofile", to:"pictures#addprofile"
  get "/showstudent", to:"pictures#showstudent"
  get "/studenthistory", to:"users#studenthistory"
  # get "/pictures/showstudent"
  post '/photo', to:"pictures#photo"
  # get "pictures/addbookphoto"
  get "pictures/show"
  # post "/borrows/:id", to:"borrows#create"
  # get "/borrows/:id", to:"borrows#update"
  get "/status", to:"users#status"
  post '/bookphoto', to:"pictures#bookphoto"
    # get "/borrowed/:id", to:"books#borrowed"
  # root "articles#index"
end
