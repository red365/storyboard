Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'user_sessions#new'
  get 'logout', to: 'user_sessions#destroy'
  get 'signup', to: 'users#new'

  resources :user_sessions, only: [ :new, :create, :destroy ]
  scope :admin do
    resources :users, except: [ :new ]
  end
end
