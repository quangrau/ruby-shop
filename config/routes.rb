Rails.application.routes.draw do

	match '/users/sign_in' => 'home#index', :via => [:get]

	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

	resources :dashboard, only: [:index]
	resources :users
	resources :categories, :products do
		get "delete"
	end

	root :to => 'home#index'

	# devise_scope :users do
	# 	get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	# end
	
end
