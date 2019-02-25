require 'rails_helper'

#:first_name,
# :last_name,
# :email,
# :password,
# :password_confirmation



RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new()
      @password = Password.new(password:"somepassword")
      @password_con = Password_Confirmation.new(password_confirmation:"somepassword")
      @user.password = @password
      @user.password_confirmation = @password_con
      @user.first_name = "Samantha"
      @product.last_name = "Smith"
      @product.email = "smith@gmail.com"
    end
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end
    it "is not valid without a password" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a price" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a category" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
    it "is not a valid quantity" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
    it "is not a valid quantity" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

  end
end
