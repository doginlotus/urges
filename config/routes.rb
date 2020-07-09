Rails.application.routes.draw do
  

  get 'smokes/quick_create' => 'smokes#quick_create'
  resources :smokes
  

  get 'urges/quick_create' => 'urges#quick_create'
  resources :urges
  

  resources :urge_fors
  get 'pages/feed'
  get 'pages/data'
  get 'pages/quitting'
  get 'pages/past'
  get 'pages/home'



  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
