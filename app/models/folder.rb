# == Schema Information
#
# Table name: folders
#
#  id         :integer          not null, primary key
#  name       :string
#  parent_id  :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Folder < ApplicationRecord
  include Pathable

  belongs_to :parent, class_name: 'Folder', required: false
  belongs_to :team

  has_many :children, class_name: 'Folder', foreign_key: 'parent_id'
  has_many :rooms
end
