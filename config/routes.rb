Rails.application.routes.draw do
  #Devise Gem for Authentication
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  #User NameSpace
  as :user do
    get "signin" => 'devise/sessions#new'
    delete "signout" => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
  end

  get 'about' => 'pages#about'
  get 'contactus' => 'pages#contactus'
  
  root :to =>   "pages#home"
  
  #Food Post Namespace
  resources :foods
    root to: 'foods#index'
    get :send_food_mail,  to: 'foods#send_food_mail', as: :send_food_mail  
    get 'foods/:id/edit', to: 'foods#edit', as: :edit
    patch 'foods/:id',    to: 'foods#update'
    #delete 'food/:id',       to: 'foods#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
