class User < ApplicationRecord

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  before_save :trim_whitespace

  private

  def trim_whitespace
    self.first_name = self.first_name.strip unless self.first_name.nil?
    self.last_name = self.last_name.strip unless self.last_name.nil?
    self.email = self.email.strip unless self.email.nil?
  end


end
