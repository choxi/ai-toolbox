Rails.application.routes.draw do
  root to: "repos#index"

  resources :repos, only: [] do
    post :search, on: :collection
  end
end
