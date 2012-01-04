class CategoryController < ApplicationController
  def show
    @category = Category.where(:id => params[:id]).last
    if @category.id == 1
      @paintings = Painting.all
    else
      @paintings = @category.paintings
    end
  end
end
