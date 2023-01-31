class User < ApplicationRecord

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :password_digest, presence: true

  before_save :trim_whitespace_and_downcase

  def trim_whitespace_and_downcase
    self.first_name = self.first_name.strip unless self.first_name.nil?
    self.last_name = self.last_name.strip unless self.last_name.nil?
    self.email = self.email.strip.downcase unless self.email.nil?
  end


  def self.authenticate_with_credentials(email, password)

    # creates lowercase, whitespace removed version of the email being looked up
    user = User.find_by_email(email.strip.downcase)

    # returns an instance of the user
    user && user.authenticate(password)

  end

end
