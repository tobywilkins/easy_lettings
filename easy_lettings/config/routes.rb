Rails.application.routes.draw do

  root "properties#index"

get '/contact-us', to: 'contact_us#index'
get '/about-us', to: 'about_us#index'


  devise_for :users
  resources :properties

end
