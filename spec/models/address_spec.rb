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

# == Schema Information
# Schema version: 99999999999999
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  addressable_id   :integer
#  addressable_type :string(255)
#  city_id          :integer
#  street           :string(255)
#  complement       :string(255)
#  number           :string(255)
#  zip_code         :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

