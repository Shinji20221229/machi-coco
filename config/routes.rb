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
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :user do

    resources :tweets, only: [:new, :create, :index, :show, :update, :destroy]
  end

  post 'users' => 'users#create'
  get 'users/new'
  get 'users/create'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'




end
