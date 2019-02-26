class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    #@user = User.find_by_email(email) 
    email_conv = email.downcase.strip 
    User.find_by(email: email_conv).try(:authenticate, password) 
  end

 

  # # def strip_whitespace(*params)
  # #   params.map{ |attr| attr.strip }
  # # end

  # def convert_to_lowercase(email)
  #   input.each do |letter|
  #     letter.downcase
  #   end
  # end


   # def strip_whitespace_from_attributes(*args)
  #   args.each do |attribute|
  #     define_method "#{attribute}=" do |value|
  #         #debugger
  #         value = value.gsub(/\s*/, "")
  #         #debugger
  #         super(value)
  #       end
  #   end
  #end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }

end
