Mcai::Application.routes.draw do

  get "search/index", :as => :search
  resources :search do
    get 'page/:page', :action => :index, :on => :collection
  end

  get "home/index"
  resources :tasks do
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
    end
  end

  root :to => 'pages#home'


  resources :p  do
    get :top, :on => :member
    get :page, :action => :show, :on => :member
    get :renew

  end


  resources :htmls

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
