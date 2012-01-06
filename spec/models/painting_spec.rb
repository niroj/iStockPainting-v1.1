require 'spec_helper'

describe Painting do
  it "can be instantiated" do
      Painting.new.should be_an_instance_of(Painting)
  end
end
