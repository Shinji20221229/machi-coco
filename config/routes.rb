Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "users/homes#top"
  get '/about' => "users/homes#about", as: "about"
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :users do

    resources :tweets, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :tweet_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update, :index]

  end




end
