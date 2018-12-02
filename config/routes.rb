Rails.application.routes.draw do

  resources :artireplies
  resources :articomments
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :researches do
    member do
      patch :approve
    end
  end
  resources :events
  resources :pictures
  resources :editorial_teams
  resources :journal_pages
  resources :publishing_processes
  resources :pending_articles
  resources :downloads
  resources :manuscripts do
    resources :reviews, except: [:show, :index]
    member do
      patch :approve
    end
  end
  resources :journals
  resources :articles do
    resources :articomments do
      resources :artireplies
    end
    member do
      patch :approve
    end
  end
  devise_for :users
  # NOTE: put this after the 'devise_for :users' line
  resources :users, only: [:index, :show]
  resources :pages
  resources :abouts
  resources :editors do
    member do
      patch :approve_editor
      patch :approve_peer
      patch :approve_publisher
    end
  end
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
