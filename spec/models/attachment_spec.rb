require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Attachment do
  before(:each) do
    @valid_attributes = {
      :attachable => ,
      :info => "value for info"
    }
  end

  it "should create a new instance given valid attributes" do
    Attachment.create!(@valid_attributes)
  end
end