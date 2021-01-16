Rails.application.routes.draw do
  resources :cocktails, only: [:new, :create, :index, :show]
end
