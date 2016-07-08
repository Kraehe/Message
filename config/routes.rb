Rails.application.routes.draw do
  resources :messengers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "messengers#index"

  delete '/messengers/:id' => 'messengers#destroy', as: 'delete_messenger'
end
