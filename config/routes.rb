Rails.application.routes.draw do
  resources :products, only: [:index, :show, :create, :update, :destroy]

  # Health check
  get '/health', to: 'health#check'
end
