class City < ActiveRecord::Base
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: cities
#
#  id          :integer         not null, primary key
#  country_id  :integer
#  province_id :integer
#  name        :string(255)
#  pop         :integer
#  created_at  :datetime
#  updated_at  :datetime
#

