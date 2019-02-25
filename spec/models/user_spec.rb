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
      #@password = Password.new(password:"somepassword")
      #@password_confirmation = Password.new(password_confirmation:"somepassword")
      # @user.password = '@password'
      # @user.password_confirmation = @password_confirmation
      @user.password = 'something2'
      @user.password_confirmation = 'something2'
      @user.first_name = "Samantha"
      @user.last_name = "Smith"
      @user.email = "smith@gmail.com"
    end
    it "is valid with valid attributes" do
      expect(@user).to be_valid
    end
    it "is not valid without a firstname" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a lastname" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a password" do
      @user.password = 'apples'
      expect(@user).to_not be_valid
    end
    it "is not a valid password" do
      @user.password_confirmation = 'oranges'
      expect(@user).to_not be_valid
    end
    it "is not a valid email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a password" do
      @user.password = 'a'
      @user.password_confirmation = 'a'
      expect(@user).to_not be_valid
    end
    it "is not valid without a password" do
      @user.password = 'adadfdasfdasfadsfadfs'
      @user.password_confirmation = 'adadfdasfdasfadsfadfs'
      expect(@user).to_not be_valid
    end

  end
end
