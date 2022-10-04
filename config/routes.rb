Rails.application.routes.draw do
  devise_for :admins
  devise_for :students, controllers: {
    sessions: 'students/sessions'
  }
  resources :books do
    member do
      get :borrowed
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
  post '/bookphoto', to:"pictures#bookphoto"
    # get "/borrowed/:id", to:"books#borrowed"
  # root "articles#index"
end
