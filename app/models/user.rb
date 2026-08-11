class User < ApplicationRecord
  EMAIL_REGEXP = /\A[^@\s]+@(?:[^@\s.]+\.)+[^@\s.]+\z/

  validates :email, :full_name, :location, :password, presence: true
  validates :password, confirmation: true
  validates :bio, length: { minimum: 30 }
  validates :email, uniqueness: true

  validate :email_format
  has_secure_password

  private

  def email_format
    return if email.blank?
    errors.add(:email, :invalid) unless email.match?(EMAIL_REGEXP)
  end
end