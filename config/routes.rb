Rails.application.routes.draw do
  get '/chessboard/solution', to: 'chessboard#solution'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
end
