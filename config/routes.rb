Rails.application.routes.draw do
  root "feedbacks#index"
  resources :feedbacks
  resources :users

  # resources :users do
  # 	resources :feedbacks
  # end
end
