Rails.application.routes.draw do
  get 'clues/index'

  resources :clues, param: :uuid
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
