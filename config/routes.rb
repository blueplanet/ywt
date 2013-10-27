Ywt::Application.routes.draw do
  get "top/welcome"

  resource :page, replace_id_with: 'token', only: [:show] do
    resources :ywt_items, only: [:create, :update, :destroy]
  end

  root to: 'top#welcome'
end
