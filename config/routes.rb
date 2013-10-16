FriendCircle::Application.routes.draw do
  resources :users
  resource :session do
    get '/forgot_password' => 'sessions#forgot_password'
    post '/forgot_password' => 'sessions#send_forgot_email'
    get 'reset_password_page'
    put 'set_new_password'
  end

  resources :f_circles
  resources :friend_circle_memberships
end


# get '/cats' => 'cats#index'
# get '/cats/:id' => 'cats#show'
# get '/crazymethod' => 'crazy#crazymethod'