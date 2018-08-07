Rails.application.routes.draw do

	# get 'signup', to: 'registrations#new', as: 'signup'
	# get 'login', to: 'sessions#new', as: 'login'
	# get 'logout', to: 'sessions#destroy', as: 'logout'

	# devise_scope :users do
	# 	get 'signup', to: 'devise/registrations#new', as: 'signup'
	# 	get 'login', to: 'devise/sessions#new', as: 'login'
	# 	get 'logout', to: 'devise/sessions#destroy', as: 'logout'
	# end

  	devise_for :users, path_names: {sign_in: "login", sign_up: "signup"}, :controllers => {:registrations => "users/registrations"}

  	get 'welcome/index'

  	resources :articles do
  		resources :comments
  	end

  	root 'welcome#index'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
