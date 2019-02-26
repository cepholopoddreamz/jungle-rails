class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    #@user = User.find_by_email(email) 
    User.find_by(email: email).try(:authenticate, password) 
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { in: 6..20 }

end
