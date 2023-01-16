Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :apartments, only: [:index, :show, :create, :destroy, :update]
  resources :tenants, only: [:index, :show, :create, :destroy, :update]
  resources :leases, only: [:create, :destroy]
end
