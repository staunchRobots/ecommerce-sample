Ecommerceapp::Application.routes.draw do
  devise_for :users
  root to: "main#index", as: "home"

  get "admin" => "admin#index", as: "admin"

  scope module: 'admin', path: '/admin' do
    resources :products
  end

  resources :products, only: [ :index, :show ]
end
