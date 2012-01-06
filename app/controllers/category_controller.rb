class CategoryController < ApplicationController
  before_filter :tag_collector
  before_filter :authenticate_user!, :except => [:show, :index, :tag_collector]
  def index
    @categories = Category.all
  end
  def show
    @category = Category.where(:id => params[:id]).last
    if @category.name == "all"
      @paintings = Painting.all
    else
      @paintings = @category.paintings
    end
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully uploaded category."
      redirect_to @category, :action => 'index'
    else
      render :action => 'new'
    end
  end
  def tag_collector
    @tags = Painting.tag_counts_on(:tags).limit(20)
  end
end
