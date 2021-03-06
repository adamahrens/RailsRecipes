# == Schema Information
#
# Table name: chefs
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  admin           :boolean          default(FALSE)
#

class Chef < ApplicationRecord
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_secure_password
  validates :password, length: { minimum: 5 }, allow_nil: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true
end
