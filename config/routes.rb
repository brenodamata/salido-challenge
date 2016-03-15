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

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
end
