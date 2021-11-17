require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'Saves a new product if all validations are true' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "Sponge Bob Popsicle", price_cents: 1500, quantity: 12, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).not_to include("Field can't be blank")
    end

    it 'Does not save a new product if name field is empty' do
      @category = Category.new(name: "test")
      @product = Product.new(name: nil, price_cents: 1500, quantity: 17, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'Does not save a new product if quantity field is empty' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "Sponge Bob Popsicle", price_cents: 1500, quantity: nil, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'Does not save a new product if price field is empty' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "Sponge Bob Popsicle", price_cents: nil, quantity: 17, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'Does not save a new product if category is empty' do
      @category = Category.new(name: "test")
      @product = Product.new(name: "Sponge Bob Popsicle", price_cents: 1500, quantity: 17, category: nil)
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
