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
  has_secure_password
  has_many :recipes, dependent: :destroy
  validates :password, presence: true, length: { minimum: 5 }
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true
end
