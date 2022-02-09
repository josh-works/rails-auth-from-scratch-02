class RegularUser < ApplicationRecord
  CONFIRMATION_TOKEN_EXPIRATION = 10.minutes
  has_many :book_quotes
  
  has_secure_password
  before_save :set_nickname
  before_save :downcase_email
  
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  
  def confirm!
    update_columns(confirmed_at: Time.current)
  end
  
  def confirmed?
    confirmed_at.present?
  end
  
  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: confirm_email
  end
  
  def unconfirmed?
    !confirmed
  end
  
  private 
  def set_nickname
    self.nickname = "#{first_name} #{last_name}"
  end
  
  def downcase_email
    self.email = email.downcase
  end
end
