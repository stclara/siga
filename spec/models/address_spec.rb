require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Address do
  before(:each) do
    @valid_attributes = {
      :addressable => ,
      :street => "value for street",
      :complement => "value for complement",
      :number => "value for number",
      :zip_code => "value for zip_code"
    }
  end

  it "should create a new instance given valid attributes" do
    Address.create!(@valid_attributes)
  end
end
