require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @product = Product.new()
      @category = Category.new(name: "Anything")
      @product.category = @category
      @product.name = 'Chairs'
      @product.price_cents = 234
      @product.quantity = 20
    end
    #making it fail 
    it "is valid with valid attributes" do
      expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
    it "is not a valide quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
  end
end
