Rails.application.routes.draw do
  resources :properties, defaults: { format: :json }, only: [:create, :show, :index]
end
