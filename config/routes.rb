Rails.application.routes.draw do
  get 'homepage/index'
  namespace :api do
    resource :app
  end

  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
