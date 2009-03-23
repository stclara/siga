class Cadum < ActiveRecord::Base
  has_many :documents
  has_many :addresses, :as => :addressable
  has_many :contacts, :as => :contactable


end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: cadums
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  sex            :string(255)
#  marital_status :string(255)
#  birth          :date
#  birthplace     :string(255)
#  time_residence :string(255)
#  profession     :string(255)
#  income         :integer
#  housing        :string(255)
#  type_housing   :string(255)
#  type_house     :string(255)
#  room           :integer
#  revenue        :integer
#  habitantes     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

