Mcai::Application.routes.draw do

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
		end
	end

  root :to => 'pages#home'

  
  resources :p  do
	  get :top
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
