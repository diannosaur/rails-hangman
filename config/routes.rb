Rails.application.routes.draw do
  root "hangman#index"
  get "/hangman", to: "hangman#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
