Rails.application.routes.draw do
  resources :properties, defaults: { format: :json }, only: [:create]
end
