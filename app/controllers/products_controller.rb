class ProductsController < ApplicationController
  respond_to :html, :js

	def index
		@products = Product.find(:all)
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new(:category_id => nil, :name => nil, :price => nil)

		@categories = Category.find(:all)
	end

	def create
		@product = Product.create(product_params)

		@products = Product.find(:all)
	end

	def edit
		@product = Product.find(params[:id])

		@categories = Category.find(:all)
	end

	def update
		@product = Product.find(params[:id])
		@product.update_attributes(product_params)

		@products = Product.find(:all)
	end

	def delete
		@product = Product.find(params[:product_id])
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy

		@products = Product.find(:all)
	end

	private
	def product_params
		params.require(:product).permit(:category_id, :name, :price)
	end
end
