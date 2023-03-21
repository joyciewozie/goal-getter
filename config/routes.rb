Rails.application.routes.draw do
  get 'goals/show'
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'goals#index'

  resources :goals do
    resources :answers, except: [:edit, :update]
    resources :collaborators
    resources :comments
    resources :highlights, except: [:index]
  end

  resources :users
  resources :highlights, only: [:index]
  resources :template_questions
end
