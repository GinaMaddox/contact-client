Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get '/' => 'client/contacts#index'

  namespace :client do
    get '/contacts' => 'contacts#index'
    get '/contacts/new' => 'contacts#new'
    post '/contacts' => 'contacts#create'
    get '/contacts/:id' => 'contacts#show'
    get '/contacts/:id/edit' => 'contacts#edit'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'
  
   get "/signup" => "users#new"
   post "/users" => "users#create"
   get "/login" => "sessions#new"
   post "/login" => "sessions#create"
   delete "/logout" => "sessions#destroy"

  end
end
