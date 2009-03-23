class Document < ActiveRecord::Base
  belongs_to :cadum
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: documents
#
#  id         :integer         not null, primary key
#  cadum_id   :integer         not null
#  kind       :string(10)      not null
#  value      :string(255)     not null
#  note       :string(255)
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

