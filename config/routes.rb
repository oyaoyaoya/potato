Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'home#index'
  get 'home/help', to: "home#help"
  get 'home/search', to: "home#search"
  get 'home/contact', to: "home#contact"
  resources :users, only: %w( edit update show ) do
    collection do
      get :faculty_select
      get :department_select
      get :sold_list
      get :bought_list
      get :contract_list
      get :hope_list
    end
  end
  resources :courses, only: %w{ show index } do
    collection do
      get 'search'
    end
  end
  resources :textbooks, only: %w( new create), shallow: true do
    resources :items, except: %w( index destroy) do
      member do
        resource :contract, only: %w( create show update )
      end
    end
  end
  resource :message, only: %w( create )

  namespace :admin do
    resources :users, :except => [:show]
    resources :schools
    resources :faculties
    resources :departments
    resources :courses
    resources :textbooks
    resources :items
  end
  get '/admin' => "admin#index"
  # get '*path', to: 'application#render_404'
end
