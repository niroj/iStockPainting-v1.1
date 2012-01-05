class PaintingsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :tag_collector
  def index
    @categories = Category.all
    @paintings = Painting.where(:status => true)
  end
  def new
    @categories = Category.all
    @painting = current_user.paintings.new
  end

  def create
    @painting = current_user.paintings.new(params[:painting])
    @painting.category_id = params[:category][:id]
    @painting.tag_list = params[:painting][:tag_list]
    if @painting.save
      flash[:notice] = "Successfully uploaded painting."
      redirect_to @painting, :action => 'index'
    else
      render :action => 'index'
    end
  end

  def show
    @categories = Category.all
    @painting = Painting.find(params[:id])
  end
  
  def buy
    @painting = Painting.find(params[:id])
    app_earning = @painting.credits*0.05
    if(current_user.credits >= (@painting.credits+app_earning))
      current_user.credits -= (@painting.credits+app_earning)
      seller = User.where(:id => @painting.user_id).last
      seller.credits += (@painting.credits-app_earning)
      @painting.status = false
      @painting.save
      current_user.save
      seller.save
      @bought_flag=1;
    end
  end
  def tag
    binding.pry
  end
  def searcher
    @search_response = Painting.search do
      fulltext params[:search]
    end
    @paintings = @search_response.results
    render "index"
  end

    def rate
    @painting = Painting.find(params[:id])
    @painting.rate(params[:stars], current_user, params[:dimension])
    # render :show do |page|
    #   page.replace_html @painting.wrapper_dom_id(params), ratings_for(@painting, params.merge(:wrap => false))
    #   page.visual_effect :highlight, @painting.wrapper_dom_id(params)
    # end
    respond_to do |format|
        format.js { render :partial => "rating" }
    end
  end


  private
    def tag_collector
      @tags = Painting.tag_counts_on(:tags).limit(20)
    end
end

