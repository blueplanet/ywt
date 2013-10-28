Ywt::Application.routes.draw do
  get "top/welcome"

  resources :pages, replace_id_with: 'token', only: [:new, :create, :show, :destroy] do
    resources :ywt_items, only: [:create, :update, :destroy]
  end

  root to: 'top#welcome'
end
