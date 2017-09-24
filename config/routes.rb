Rails.application.routes.draw do
  
  get '/', to: 'home#index'
  get 'login', to: 'user_sessions#new'
  get 'logout', to: 'user_sessions#destroy'
  get 'signup', to: 'users#new'

  resources :user_sessions, only: [ :new, :create, :destroy ]
  scope :admin do
    resources :users, except: :new
  end
  resources :projects do
    resources :domains, except: [ :index ]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
