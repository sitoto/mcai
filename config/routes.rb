Mcai::Application.routes.draw do

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
      get "home"
      get "about"
      get "douban_group", :as => :doubangroup
      get "tianya_bbs", :as => :tianyabbs

    end
  end

  root :to => 'pages#home'


  resources :p  do
    get :top, :on => :member
    get :page, :action => :show, :on => :member
    post :renew, :on => :member

  end


  resources :htmls
  post "/auth/:provider/callback", to: "sessions#create"
  get "/auth/:provider/failure", to: "sessions#failure"
  get "/logout", to: "sessions#destroy", :as => "logout"

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

    resources :events 
  end


end
