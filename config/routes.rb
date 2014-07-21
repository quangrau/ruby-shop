Rails.application.routes.draw do

	get 'categories/index'

	get 'products/index'

	get 'product/index'

	get 'dashboard/index'

	match '/users/sign_in' => 'home#index', :via => [:get]

	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

	resources :users, :dashboard, :categories, :products

	root :to => 'home#index'

	# devise_scope :users do
	# 	get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
	# end
	
end
