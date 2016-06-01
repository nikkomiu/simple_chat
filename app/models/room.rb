# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Room < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :team_folder, required: false
  belongs_to :team

  has_many :messages, -> { order created_at: :desc }
end
