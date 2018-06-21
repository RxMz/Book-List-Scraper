Rails.application.routes.draw do
	root 'terms#index'
	#require 'sidekiq/web'
	#mount Sidekiq::Web => "/sidekiq"
  resources :courses do 
  	resources :book
  end
  resources :book_lists
  resources :terms

  get 'book_lists_generator', to: 'book_lists#string_generator'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
