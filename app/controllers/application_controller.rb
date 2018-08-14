class ApplicationController < ActionController::Base

	protected
	
	def ensure_admin_user!
		unless current_user && current_user.role.name == "Admin"
			redirect_to articles_url, alert: "Access denied!"
		end
	end

end
