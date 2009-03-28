require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Area do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :kind => "value for kind",
      :geom => 
    }
  end

  it "should create a new instance given valid attributes" do
    Area.create!(@valid_attributes)
  end
end
