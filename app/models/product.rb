class Product < ActiveResource::Base
	self.site = "http://ruby-store.dev:3000/api/"
	self.element_name = "product"
	self.user = "quangrau"
	self.password = "123456"
end
