Rails.application.routes.draw do
  devise_for :users
 # get 'blogs', to: 'blogs#index'
 root to: 'top#index'
 get 'top' => 'top#index'
 get 'entry' => 'entries#new'
 post 'entry' => 'entries#new'
 post 'confirm' => 'entries#confirm'
 post 'thanks' => 'entries#thanks'
 #get 'login' => 'entries#login'
end
