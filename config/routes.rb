DomoticaProyect::Application.routes.draw do

  resources :schedules

  resources :clients

  #devise_for :users
  devise_for :users #, :skip => [:sessions]
    #as :user do
      #get 'signin' => 'devise/sessions#new', :as => :new_user_session
      #post 'signin' => 'devise/sessions#create', :as => :user_session
      #delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
      #match 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session,
      #:via => Devise.mappings[:user].sign_out_via
    #end

    #post '/api/register' => 'thermostat_histories#create'

  root 'principals#index'

  get '/manager/users_list' => 'manager#users_list'
  get '/manager/show_user/:id' => 'manager#show_user'
  get '/manager/delete_user/:id' => 'manager#delete_user'
  get '/manager/enable_user/:id' => 'manager#enable_user'
  get '/manager/disable_user/:id' => 'manager#disable_user'
  get '/manager/change_role/:id' => 'manager#change_role'
  get '/local_weather/:location_id' =>'local_weather#show'
  resources :manager

  # get '/locations/:location_id/thermostats/config_temp/:id' => 'thermostats#configure_temperatures'
  #post '/locations/:location_id/thermostats/set_config_temp/:id' => 'thermostats#set_temperatures'


  #get '/locations/:location_id/thermostats/:id' => 'thermostats#show_readings'

 get   '/thermostat_histories' =>  'thermostat_histories#index'
 post   '/api/register'  => 'thermostat_histories#create'
 get  '/api/get_temp/:serial_number' => 'thermostat_histories#show_temperature_request'
 get   '/api/register/new' =>  'thermostat_histories#new'
 get   '/api/register/:id/edit' => 'thermostat_histories#edit'
 get   '/api/register/:id' => 'thermostat_histories#show'
 patch  '/api/register/:id' =>  'thermostat_histories#update'
 put  '/api/register/:id'  =>  'thermostat_histories#update'
 delete   '/api/register/:id' =>   'thermostat_histories#destroy'

  #post '/thermostat_histories/create' => 'thermostat_histories#create'

  resources :locations do
    resources :thermostats  
  end
  get '/locations/:location_id/thermostats/config_temp/:id' => 'thermostats#configure_temperatures'
  post '/locations/:location_id/thermostats/set_config_temp/:id' => 'thermostats#set_temperatures'


  #get '/locations/:location_id/thermostats/readings/:id' => 'thermostats#show_readings'

  post '/alerts/check_temperature' => 'alerts#check_temperature'
  post '/alerts/save_setting_alert' => 'alerts#save_setting_alert'
  get '/alerts/alert_setting_list' => 'alerts#alert_setting_list'
  get '/alerts/alert_list/:id' => 'alerts#alert_list'
  get '/alerts/setting_alert/:id' => 'alerts#setting_alert'
  get '/alerts/send_temperture/:id' => 'alerts#send_temperture'

  resources :alerts

  get '/temperatures/edit/:id' => 'temperatures#edit'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
