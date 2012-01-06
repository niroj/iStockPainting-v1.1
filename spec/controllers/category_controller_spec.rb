require 'spec_helper'

describe CategoryController do
  it "can be instantiated" do
      Category.new.should be_an_instance_of(Category)
  end
end
