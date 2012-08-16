Ecommerceapp::Application.routes.draw do
  devise_for :users
  root to: "main#index", as: "home"
  resources :products, only: [ :index, :show ]
  get "admin" => "admin#index", as: "admin"

  scope module: 'admin', path: '/admin' do
    resources :products, as: "admin_products"
    resources :users, as: "admin_users"
  end

  resources :line_items, only: [ :create, :destroy ]
  resources :carts, only: [ :show, :destroy ]
  get "catalog" => "catalog#show", as: "catalog"

  scope "/catalog" do
    get "per_category" => "catalog#per_category", as: "per_category"
  end

  get "search" => "search#query", as: "search"

end
