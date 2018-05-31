Rails.application.routes.draw do
	root 'terms#index'
  resources :courses do 
  	resources :book
  end
  resources :book_lists
  resources :terms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
