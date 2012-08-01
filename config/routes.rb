Ecommerceapp::Application.routes.draw do
  devise_for :users
  root to: "main#index", as: "home"
  scope path: '/admin', controller: :admin do
    get 'index' => :index, as: "admin"
  end
end
