# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  beer_id    :integer
#

class Note < ApplicationRecord
  belongs_to :beer
end
