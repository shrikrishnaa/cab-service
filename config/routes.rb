Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cabs
  resources :customers
  resources :cab_bookings do
    get :cab_request, on: :collection
    post :cab_booking, on: :collection
    put :start_travel, on: :collection
    put :finish_travel, on: :collection
  end
end
