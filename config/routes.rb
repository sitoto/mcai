Mcai::Application.routes.draw do

  resources :lamp_sets do 

    resources :lamp_paras
  end

  get "wlamp/:id"  =>  "pages#weixin", as: 'wlamp'
  resources :lamps do
    collection do
      get "search"
    end
    member do 
      post "clone"
    end
  end

  resource :weixin do
    get "all"
  end

  resources :novels

  resources :flinks

  get "pages/hot", :as => :hot
  get "pages/last", :as => :last

  get "search/index", :as => :search
  get "search/launch", :as => :launch

  resources :search do
    get 'page/:page', :action => :index, :on => :collection
  end

  get "home/index"
  resources :tasks do
    collection do
      get "douban_group"
    end
    member do 
      get :preview
    end
  end


  resources :rules

  get "about" => "pages#about"
  resources :pages do
    collection do 
      get "search/:name" => 'pages#wsearch',  :as => :search
      get "home"
      get "about"
      get "douban_group", :as => :doubangroup
      get "tianya_bbs", :as => :tianyabbs
      get 'author/:name' => 'pages#author', :as => :author
      get 'category/:name' => 'pages#category' , :as => :category

    end
  end

  root :to => 'pages#home'


  resources :p  do
    get :top, :on => :member
    get :page, :action => :show, :on => :member
    post :renew, :on => :member

  end


  resources :htmls
  get "/auth/new", to: "sessions#new"
  get "/auth/:provider/callback", to: "sessions#create"
  post "/auth/:provider/callback", to: "sessions#create"
  get "/auth/:provider/failure", to: "sessions#failure"
  get "/auth/failure", to: "sessions#failure"

  get "/logout", to: "sessions#destroy", :as => "logout"

  resources :identities

  namespace :cpanel do 
    root :to => "home#index"
    resources :tasks  do 
      collection do 
        get "douban_group"
        get "tieba"
        get "tianyabbs"
        get "sohubbbs"
      end
    end

    resources :flinks
    resources :events 
  end


end
