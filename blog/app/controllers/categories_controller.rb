class CategoriesController < ApplicationController

	def create
  		@category = Category.new(category_params)
  		@category.save
  		redirect_to '/articles/new'
	end
	
private
    def category_params
      params.require(:category).permit(:name)
    end

end 