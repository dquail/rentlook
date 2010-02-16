ActionController::Routing::Routes.draw do |map|
  

  map.login "login", :controller => "user_sessions", :action =>"new"
  # TODO: Make the users controller handle both landlord and tenant create
  #map.signup "signup", :controller => "users", :action =>"new"
  map.signup "signup", :controller => "users", :action =>"new"
  map.logout "logout", :controller => "user_sessions", :action =>"destroy"
  # TODO: Make the account redirect to either landlord or tenant controller
  map.account "account", :controller =>"users", :action =>"show"
  #map.account "account", :controller =>"landlords", :action =>"show"

  map.resources :occupancies
  map.resources :listings
  map.resources :user_sessions
  map.resources :password_resets, :except => [:show]
  map.resources :new_user_instructions
  map.resources :user_verifications, :only => [:show]
  map.resources :users
  map.resources :landlords
  map.resources :tenants, :shallow=>true do |tenant|
    tenant.resources :occupancies, :shallow =>true
    tenant.resources :leases, :shallow => true
  end
  map.resources :properties, :shallow=>true do |property|
      property.resources :units, :shallow=>true do |unit|
        unit.resources :leases, :shallow =>true
        unit.resources :occupancies, :shallow =>true
        unit.resources :applications, :shallow =>true
      end
  end
  map.resources :units, :only => [:index]

  map.connect 'applications/approve/:id',
          :controller => 'applications',
          :action => "approve",
          :conditions => { :method => :post }
  map.connect 'applications/reject/:id',
          :controller => 'applications',
          :action => "reject",
          :conditions => { :method => :post }

  map.connect 'units/create_application/:id',
          :controller =>'units',
          :action => "create_application",
          :conditions=>{:method=>:put}

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => :users_sessions, :action=>:new

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
