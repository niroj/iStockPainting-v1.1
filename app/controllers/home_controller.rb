class HomeController < ApplicationController
  before_filter :tag_collector
  def index
  @painting = select_featured_painting
    if user_signed_in?
      redirect_to painting_path(@painting)
    end
  end
  def tag_collector
    @tags = Painting.tag_counts_on(:tags).limit(20)
  end
end

def select_featured_painting
  # @painting = Painting.find(:all, :order => "created_at DESC");
  # @max = Rate.where(:rateable_id => @painting.first.id).average(:stars).to_f
  # @rating = 0
  # @highest_painting = []
  # # @painting.each do |p|
  #   # @rating = Rate.where(:rateable_id => p.id).average(:stars).to_f
  #   ###@highest_painting << Rate.find(:all, :conditions => "stars > 0")
  #   # if @max < @rating
  #   #   @highest_painting << p
  #   #   @max = @rating
  #   # end
  # # end

  @highest_painting = Painting.where(:status => true)
  @highest_painting[rand(@highest_painting.length)]

end

