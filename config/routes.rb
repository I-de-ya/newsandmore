Newsandmore::Application.routes.draw do


  resources :sections

  resources :dish_types

  resources :images

  resources :menu_sections

  resources :texts

  resources :sliders

  devise_for :admins

  resources :sports

  resources :broadcasts

  resources :posts

  resources :movies

  resources :messages


  resources :menu_types



  namespace :admin do
    root :to => 'events#index'
    resources :events do
      get 'toggleshow', :on => :member
    end
    
    root :to => 'movies#index'
    resources :movies do
      get 'toggleshow', :on => :member
    end

    resources :reservations do
      get 'toggleshow', :on => :member
    end
    resources :images do
      get 'toggleshow', :on => :member
    end
    resources :texts do
      get 'toggleshow', :on => :member
    end
    resources :posts do
      get 'toggleshow', :on => :member
    end
    resources :recalls do
      get 'toggleshow', :on => :member
    end
    resources :sports do
      get 'toggleshow', :on => :member
    end
    resources :broadcasts do
      get 'toggleshow', :on => :member
    end
    resources :sliders do
      resources :images do
        put 'update_ind', :on => :collection
        post 'sort', :on => :collection
      end
      get 'toggleshow', :on => :member
      post 'sort', :on => :collection
      get 'active', :on => :member
    end
    resources :sections do
      get 'toggleshow', :on => :member
      post 'sort', :on => :collection
      resources :dish_categories do
        get 'toggleshow', :on => :member
        resources :dishes do
          get 'toggleshow', :on => :member
          resources :dish_types do
            get 'toggleshow', :on => :member
          end
        end
      end
    end
    resources :dish_types do
      get 'toggleshow', :on => :member
      post 'sort', :on => :collection
    end
    resources :dish_categories do
      get 'toggleshow', :on => :member
      post 'sort', :on => :collection
    end
    resources :dishes do
      get 'toggleshow', :on => :member
      get 'visible', :on => :member
      post 'sort', :on => :collection 
      
      resources :dish_images    
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  match '/index' => 'pages#index'
  match '/main' => 'pages#main'
  match '/about' => 'pages#about'
  match '/admin_page' => 'pages#admin'
  
  match '/main_dishes' => 'pages#main_dishes'
  match '/breakfasts' => 'pages#breakfasts'
  match '/kids_menu' => 'pages#kids_menu'
  match '/bar_list' => 'pages#bar_list'
  
  match '/banquet' => 'pages#banquet'
  match '/reservation' => 'reservations#new'
  match '/contacts' => 'messages#new'

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  resources :reservations
  resources :recalls
  resources :events
  resources :dishes
  resources :dish_categories

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
