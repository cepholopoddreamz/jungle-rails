class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  # def name
  #   "#{self.first_name} #{self.last_name}"
  # end
end
