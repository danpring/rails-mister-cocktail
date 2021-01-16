Rails.application.routes.draw do
  resources :cocktails, only: %i[new create index show destroy]
end
