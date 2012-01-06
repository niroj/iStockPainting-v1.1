class Painting < ActiveRecord::Base
  validates_presence_of :title, :credits, :inspiration, :image

  attr_accessible :category_id, :title, :credits, :inspiration, :image, :remote_image_url
  belongs_to :user
  belongs_to :category

  ajaxful_rateable :stars => 10, :dimensions => [:beauty], :allow_update => true

  acts_as_taggable

  searchable do
    text :title, :boost => 9
    text :inspiration, :boost => 7
    text :publish_month
    string :publish_month
  end

  def publish_month
    self.created_at.strftime("%B %Y")
  end

  mount_uploader :image, ImageUploader
end

