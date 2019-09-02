# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  recipe_id   :integer
#
class Comment < ApplicationRecord
  validates :description, presence: true
  belongs_to :chef
  belongs_to :recipe

  scope :latest_comments, -> { order(updated_at: :desc) }
end
