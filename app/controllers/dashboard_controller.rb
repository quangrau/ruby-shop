class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		@categories = Category.find(:all)
		@products = Product.find(:all)
	end
end
