Rails.application.routes.draw do
  root "hangman_states#index"
  resources :hangman_states do
    resources :guesses
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
