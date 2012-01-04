class Category < ActiveRecord::Base
  has_many :paintings
  
  acts_as_taggable
end
