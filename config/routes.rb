Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'settings#index', as: :home

  resources :settings

  controller :config_load do
    get 'config_load' => :new
    post 'config_load' => :create
  end
end
