Rails.application.routes.draw do
  resources :cocktails, only: %i[new create index show destroy] do
    resources :doses, only: %i[new create destroy]
  end
end
