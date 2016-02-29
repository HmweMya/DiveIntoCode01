Rails.application.routes.draw do
  
  get 'users/index'

  get 'users/show'

  devise_for :users, controllers: { 
    sessions: "users/sessions", 
    registrations: "users/registrations", 
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks" 
  }
     #root to:"top#index"
     resources :blogs
     get 'blogs', to: 'blogs#index'
     root to: 'top#index'
     get 'top' => 'top#index'
     get 'entry' => 'entries#new'
     post 'entry' => 'entries#new'
     post 'confirm' => 'entries#confirm'
     post 'thanks' => 'entries#thanks'
     #get 'login' => 'entries#login'
end
