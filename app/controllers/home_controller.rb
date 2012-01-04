class HomeController < ApplicationController
  before_filter :tag_collector
  def index
    if user_signed_in?
      redirect_to painting_path(8)
    end
  end
  def tag_collector
    @tags = Painting.tag_counts_on(:tags).limit(20)
  end
end
