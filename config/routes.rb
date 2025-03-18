Rails.application.routes.draw do
  get "daily_questions/index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  get "homes/top"
  root "home#top"
  resources :posts, only: %i[index new create show edit]
  resources :daily_questions, only: [ :index, :show ]

  resource :profile, only: [ :show, :edit, :update ]

  # 他のユーザーのプロフィール
  resources :profiles, only: [ :show ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
