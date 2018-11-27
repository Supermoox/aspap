Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :researches do
    member do
      patch :approve
    end
  end
  resources :events
  resources :pictures
  resources :downloads
  resources :manuscripts do
    resources :reviews, except: [:show, :index]
    member do
      patch :approve
    end
  end
  resources :journals
  resources :articles
  devise_for :users
  # NOTE: put this after the 'devise_for :users' line
  resources :users, only: [:index, :show]
  resources :pages
  resources :abouts
  resources :editors
  resources :constitutions
  resources :my_posts
  resources :my_articles
  resources :executives
  resources :directorates
  resources :my_manuscripts
  resources :posts do
  	resources :comments do
  		resources :replies
  	end
  end
  resources :searches do
    member do
      patch :create 
    end
  end
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  root 'pages#index'

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
