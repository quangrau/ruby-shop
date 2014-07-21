class Product < ActiveResource::Base
	self.site = "http://limitless-beyond-2542.herokuapp.com/api/"
	self.element_name = "product"
	self.user = "quangrau"
	self.password = "123456"

	def category
		@category ||= Category.find(category_id) unless category_id.blank?
	end
end
