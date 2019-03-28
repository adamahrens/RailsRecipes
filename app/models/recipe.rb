# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chef_id     :integer
#
class Recipe < ApplicationRecord
  belongs_to :chef
  validates :name, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { in: 4..500 }
end
