# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id   :integer          not null, primary key
#  name :string
#
class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes
  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 3, maximum: 25 }
end
