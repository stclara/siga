require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Cadum do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :sex => "value for sex",
      :marital_status => "value for marital_status",
      :birth => Date.today,
      :birthplace => "value for birthplace",
      :time_residence => "value for time_residence",
      :profession => "value for profession",
      :income => 1,
      :housing => "value for housing",
      :type_housing => "value for type_housing",
      :type_house => "value for type_house",
      :room => 1,
      :revenue => 1,
      :habitantes => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Cadum.create!(@valid_attributes)
  end
end
