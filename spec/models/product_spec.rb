require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'Saves a new product if all validations are true' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "Sponge Bob Popsicle", price_cents: 1500, quantity: 12, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).not_to include("Field can't be blank")
    end


  end
end

