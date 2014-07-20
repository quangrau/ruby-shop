class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable

	devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

	# Config Asscociation
	has_many :authentications

	def self.from_omniauth(auth)
		authentication = Authentication.where(auth.slice(:provider, :uid)).first_or_initialize

		if authentication.user.blank?
			user = User.where('email = ?', auth["info"]["email"]).first
			if user.blank?
				user = User.new
				user.password = Devise.friendly_token[0, 20]
				user.name = auth.info.name
				user.email = auth.info.email
				user.uid = auth.uid
				user.facebook_link = auth.info.urls.Facebook
				user.save
			end
			authentication.provider = 'facebook'
			authentication.user_id = user.id
			authentication.uid = auth.uid
			authentication.save
		end
		authentication.user
	end

	def self.new_with_session(params, session)
		super.tap do |user|
			if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
				user.email = data["email"] if user.email.blank?
			end
		end
	end

end
