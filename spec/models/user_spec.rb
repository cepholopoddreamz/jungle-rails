require 'rails_helper'
RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new()
    @user.password = 'something2'
    @user.password_confirmation = 'something2'
    @user.first_name = "Samantha"
    @user.last_name = "Smith"
    @user.email = "smith@gmail.com"
    @user.save
  end
  describe 'Validations' do
   
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
    it "is not valid if less then 6 characters" do
      @user.password = 'a'
      @user.password_confirmation = 'a'
      expect(@user).to_not be_valid
    end
    it "is not valid if more then 20 characters" do
      @user.password = 'adadfdasfdasfadsfadfs'
      @user.password_confirmation = 'adadfdasfdasfadsfadfs'
      expect(@user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do

    it "is valid and meets validation requirements" do
      user = User.authenticate_with_credentials('smith@gmail.com','something2')
      expect(user).to eq(@user) #object equivalence
    end
    #we're testing that it fetches the right user, when we give it info to  fetch from the database
    it 'wrong email' do
      user = User.authenticate_with_credentials('apples@gmail.com','something2')
      expect(user).to be_nil
      #user.password_confirmation = nil
    end
    it 'wrong password' do
      user = User.authenticate_with_credentials('smith@gmail.com','something2b')
      expect(user).to be_falsey
      #user.password_confirmation = nil
    end
  end
end
