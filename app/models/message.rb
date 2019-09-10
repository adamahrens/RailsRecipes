class Message < ApplicationRecord
  belongs_to :chef

  validates :content, presence: true
  validates :chef, presence: true

  scope :latest_messages, -> { order(updated_at: :desc) }
end
