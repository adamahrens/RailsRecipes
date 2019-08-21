# frozen_string_literal: true

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
  belongs_to :chef, touch: true
  has_and_belongs_to_many :ingredients
  validates :name, presence: true, length: { minimum: 4 }
  validates :description, presence: true, length: { in: 4..500 }
  validates :chef_id, presence: true
end
