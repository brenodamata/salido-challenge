Rails.application.routes.draw do
  resources :menu_items do
    get '/locations', to: "locations#brand_locations", as: 'brand_locations'

    resources :locations do
      resources :prices
    end
  end
  resources :price_levels
  resources :order_types
  resources :day_parts
  resources :locations
  resources :brands

  root 'prices#index'
  post '/search', to: 'prices#search'
  get '/search', to: 'prices#results'
  # root 'salidos#brands'
  # get '/:brand_id/locations', to: 'salidos#locations', as: 'brand_locations' 
  # get '/:location_id/order_types', to: 'salidos#order_types', as: 'location_order_types'
  # get '/:location_id/:order_type_id/prices', to: 'salidos#prices', as: 'location_order_type_prices'
end
