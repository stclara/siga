require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contact do
  before(:each) do
    @valid_attributes = {
      :contactable => ,
      :kind => "value for kind",
      :value => "value for value",
      :info => "value for info"
    }
  end

  it "should create a new instance given valid attributes" do
    Contact.create!(@valid_attributes)
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: contacts
#
#  id               :integer         not null, primary key
#  contactable_id   :integer
#  contactable_type :string(255)
#  kind             :string(20)      not null
#  value            :string(30)      not null
#  info             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

