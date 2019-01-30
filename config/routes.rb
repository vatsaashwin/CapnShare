Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  #get '/users' => 'users#user', as: :user_root # creates user_root_path

  namespace :users do
    #root 'users#user' # creates user_root_path
    # get 'users#sign_in', to: 'devise/sessions#new'
    # get 'users#sign_out' => 'devise/sessions#destroy'     
  end

  get 'pages/home'
  root "pages#home"
  as :user do
    get "signin" => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
  end  
  
  # root :to => "pages#index"
  get 'about' => 'pages#about'
  get 'contactus' => 'pages#contactus'  
  resources :foods
    root to: 'foods#index'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
