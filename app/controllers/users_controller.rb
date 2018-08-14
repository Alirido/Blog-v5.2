class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_admin_user!
  	
  	def index
  		@users = User.all.order(:email)
  	end
end
