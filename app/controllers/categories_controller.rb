class CategoriesController < ApplicationController
	respond_to :html, :js

	def index
		@categories = Category.find(:all)
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new(:name => nil)
	end

	def create
		@category = Category.create(category_params)

		@categories = Category.find(:all)
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update_attributes(category_params)

		@categories = Category.find(:all)
	end

	def delete
		@category = Category.find(params[:category_id])
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy

		@categories = Category.find(:all)
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end
