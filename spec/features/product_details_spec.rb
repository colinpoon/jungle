require 'rails_helper'

RSpec.feature "users can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "user can see all products" do
    visit root_path
    first(".product").click_link('Details')
    # save_screenshot
    expect(page).to have_content 'Description'
  end

end