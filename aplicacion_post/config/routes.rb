Rails.application.routes.draw do

  resources :posts do
  	resources :comentarios_post	
  end
  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
