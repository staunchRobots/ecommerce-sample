Ecommerceapp::Application.routes.draw do
  devise_for :users
  root to: "main#index", as: "home"
  resources :products, only: [ :index, :show ]
  get "admin" => "admin#index", as: "admin"

  scope module: 'admin', path: '/admin' do
    resources :products, as: "admin_products"
  end

end
