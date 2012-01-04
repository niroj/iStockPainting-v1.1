class Painting < ActiveRecord::Base
  attr_accessible :category_id, :title, :credits, :inspiration, :image, :remote_image_url
  belongs_to :user
  belongs_to :category
  
  acts_as_taggable
    
    searchable do
        text :title, :inspiration
    end    
  mount_uploader :image, ImageUploader
end
