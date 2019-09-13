# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  chef_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :chef

  validates :content, presence: true
  validates :chef, presence: true

  scope :latest_messages, -> { order(updated_at: :desc) }
end
