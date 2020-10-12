Rails.application.routes.draw do


  
  resources :reactions
  resources :artireplies
  resources :articomments
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :researches do
    member do
      patch :approve
    end
  end
  resources :application_forms
  resources :payments do 
    member do
      patch :request_topay
      patch :check_balance
    end
  end
  
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :received_applications
  resources :events
  resources :pictures
  resources :editorial_teams
  resources :journal_pages
  resources :publishing_processes
  resources :pending_articles
  resources :pending_researches
  resources :downloads
  resources :manuscripts do
    resources :reviews, except: [:show, :index]
    member do
      patch :approve
    end
  end
  resources :journals
  resources :articles do
    resources :reactions, except: [:show, :index]
    resources :articomments do
      resources :artireplies
    end
    member do
      patch :approve
      patch :unrecommend
      put "like" => "articles#vote"
    end
  end
  #devise_for :users
  resources :memberships

  # NOTE: put this after the 'devise_for :users' line
  #removed this only: [:index, :show] 
  resources :users, only: [:index, :show]  do
    resources :memberships, except: [:show, :index]
    member do
      patch :verify_user
      patch :delete_user
    end
  end
  resources :pages
  resources :abouts
  resources :editors do
    member do
      patch :approve_editor
      patch :approve_peer
      patch :approve_publisher
      patch :verify_user
    end
  end
  resources :constitutions
  resources :my_posts
  resources :my_articles
  resources :my_researches
  resources :my_applications
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

  get :find, controller: :pages
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
