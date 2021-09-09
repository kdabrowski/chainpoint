Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'submit',  to: 'badges#new'
  get 'success', to: 'badges#success'
  post 'create',  to: 'badges#create'
end
