class User < ActiveRecord::Base
  has_secure_password

  # def name
  #   "#{self.first_name} #{self.last_name}"
  # end
end
