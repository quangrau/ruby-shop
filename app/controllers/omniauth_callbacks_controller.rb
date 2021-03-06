class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
		auth = request.env["omniauth.auth"]

		# # You need to implement the method below in your model (e.g. app/models/user.rb)
	    @user = User.from_omniauth(auth)

	    if @user.persisted?
	      sign_in @user, :event => :authentication #this will throw if @user is not activated
	      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	      redirect_to dashboard_index_path
	    else
	      session["devise.facebook_data"] = request.env["omniauth.auth"]
	      redirect_to new_user_registration_url
	    end
	end

end
