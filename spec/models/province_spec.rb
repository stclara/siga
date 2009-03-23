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

# == Schema Information
# Schema version: 99999999999999
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  country_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

