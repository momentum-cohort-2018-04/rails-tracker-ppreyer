# == Schema Information
#
# Table name: beers
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  style      :string
#  hop        :string
#  yeast      :string
#  malts      :string
#  ibu        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :integer
#  alcohol    :float
#  seen       :boolean
#

class Beer < ApplicationRecord
  has_many :notes, dependent: :destroy
end
