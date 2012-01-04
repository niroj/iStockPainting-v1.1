class Painting < ActiveRecord::Base
  attr_accessible :category_id, :title, :credits, :inspiration, :image, :remote_image_url
  belongs_to :user
  belongs_to :category

  acts_as_taggable

    searchable do
        text :title, :boost => 9
        text :inspiration, :boost => 7
        text :publish_month
        text :category
        string :publish_month


    end
    def publish_month
   		 created_at.strftime("%B %Y")
  	end
  	def category
			Category.where(:id => :category_id).last
  	end

  mount_uploader :image, ImageUploader
end

