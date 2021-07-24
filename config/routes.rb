Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home";
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    registrations: 'users/registrations'
                                  }
resources :users, only: [:show]
resources :rooms
resources :photos

resources :rooms do
  resources :reservations, only: [:create]
end

get "/preload" => "reservations#preload"
get "/preview" => "reservations#preview"

end
