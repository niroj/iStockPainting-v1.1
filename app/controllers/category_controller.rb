class CategoryController < ApplicationController
  before_filter :tag_collector
  def show
    @category = Category.where(:id => params[:id]).last
    if @category.id == 1
      @paintings = Painting.all
    else
      @paintings = @category.paintings
    end
  end
  def tag_collector
    @tags = Painting.tag_counts_on(:tags).limit(20)
  end
end
