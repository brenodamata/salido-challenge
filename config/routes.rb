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
end
