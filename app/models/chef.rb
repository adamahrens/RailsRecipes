# == Schema Information
#
# Table name: chefs
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chef < ApplicationRecord
  has_many :recipes
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true
end
