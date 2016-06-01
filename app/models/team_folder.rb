# == Schema Information
#
# Table name: team_folders
#
#  id         :integer          not null, primary key
#  name       :string
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamFolder < ApplicationRecord
  belongs_to :team

  has_many :rooms
end
