Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#start'

  #Werbeseite
  get '/info', to: 'application#info'

  #Normaler Login
  post '/login', to: 'application#login'
  post '/logout', to: 'application#logout'

  #Login für SuS
  get '/testen', to: 'application#frontend'
  post '/testen_login', to: 'application#login_frontend'
  post '/testen_logout', to: 'application#logout_frontend'

  #Masquerading Login durch Admin
  get '/login', to: 'application#start_masquerade'
  get '/logout', to: 'application#end_masquerade'

  #Einfache URLs für Haupt-SPAs
  get '/klassenbuch', to: 'groups#index'
  get '/start', to: 'users#show'

  #Einfache URLs für andere Seiten/Funktionen
  get '/willkommen', to: 'users#register'
  patch '/willkommen', to: 'users#register'
  get '/passwort', to: 'users#recover'
  post '/passwort', to: 'users#recover'

  # Vue Router routes TBD
  get '/testverwaltung', to: 'users#show'
  get '/testuebersicht', to: 'users#show'

  # API endpoints
  put '/users/:id/mail', to: 'users#user_mail'
  get '/users/core_data', to: 'users#get_core_data'
  get '/materials/info', to: 'materials#get_material_data'
  get '/tests/info', to: 'tests#get_tests_data'

  #Reguläres REST-Routing
  resources :users

  resources :students do
    resources :results
  end

  resources :groups do
    resources :assessments do
      resources :annotations
    end
    resources :group_shares
  end

  resources :tests
  resources :materials
end
