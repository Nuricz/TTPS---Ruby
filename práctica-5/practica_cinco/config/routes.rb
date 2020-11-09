Rails.application.routes.draw do
  resources :employees, :except => :delete
  resources :offices, :except => :delete
  get '/', action: :salute, controller: 'polite'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
