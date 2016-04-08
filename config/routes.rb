Rails.application.routes.draw do
  resources :menu_items do
    get '/locations', to: "locations#brand_locations", as: 'brand_locations'
    resources :prices
    resources :locations
  end

  resources :price_levels
  resources :order_types
  resources :day_parts

  resources :locations do
    resources :price_level_associations, except: :show
  end

  resources :brands

  root 'prices#lookup'
  post '/search', to: 'prices#search'
  get '/search', to: 'prices#results'
end
