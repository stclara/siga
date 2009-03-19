require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Province do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :pop => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Province.create!(@valid_attributes)
  end
end