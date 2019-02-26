require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10, #this matches the count below. if it doesn't an error is produced
        price: 64.99
      )
    end
  end

  scenario "users can navigate from the home page to the product detail pag" do
    # ACT
    visit root_path
    first('.btn.btn-primary').click

    # # DEBUG
    # save_screenshot

    # VERIFY
    has_content?('My Cart (1)')
  end
end