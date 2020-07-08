Rails.application.routes.draw do
  get 'urges/quick_create' => 'urges#quick_create'
  resources :urges
  resources :urge_fors
  root 'pages#home'
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
