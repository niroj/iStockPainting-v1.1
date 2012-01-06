class Category < ActiveRecord::Base
  has_many :paintings
  validates_presence_of :name, :description
  
  acts_as_taggable
end
