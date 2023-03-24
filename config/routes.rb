Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'goals#index'

  resources :goals do
    resources :collaborators, except: [:index]
    resources :comments
    resources :highlights, except: [:index]
    resources :insights, only: %i[new create show index] do
      resources :answers, only: [:create]
    end
    get :insight
    # GET insights/:insight_id/answers -> "insights#answers"
  end

  resources :collaborators, only: [:index]

  # resources :insights, only: %i[show] do
  #   get :answers
  # end

  # route: GET insights/:insight_id/answers --> "insights#answers"
  # route: POST insights/:insight_id/donkey -> insights#donkey

  resources :users
  resources :highlights, only: [:index]
  resources :template_questions
end
