require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should exist after being created with a name, price, quantity, and category." do
      
      @fake_category = Category.create(name: "Nightshade")
      

      @fake_product = Product.create(name: "Denethorian Tomato", price_cents: 1799, quantity: 700, category: @fake_category)
      

      expect(@fake_product).to be_valid

    end
    
    it "should have a name" do
      @fake_category = Category.create(name: "Nightshade")
      

      @fake_product = Product.create(name: nil, price_cents: 1799, quantity: 700, category: @fake_category)

      expect(@fake_product.name).to be_nil

      # checks that the error matches if name is provided as nil
      expect(@fake_product.errors.full_messages).to include "Name can't be blank"

    end

    it "should have a price" do
      
      @fake_category = Category.create(name: "Nightshade")

      @fake_product = Product.create(name: "Denethorian Tomato", price_cents: nil, quantity: 700, category: @fake_category)

      expect(@fake_product.price).to be_nil
      expect(@fake_product.errors.full_messages).to include "Price can't be blank"

    end

    it "should have a quantity" do
      
      @fake_category = Category.create(name: "Nightshade")

      @fake_product = Product.create(name: "Denethorian Tomato", price_cents: 9999, quantity: nil, category: @fake_category)

      expect(@fake_product.quantity).to be_nil
      expect(@fake_product.errors.full_messages).to include "Quantity can't be blank"

    end


    it "should have a category" do
      
      @fake_category = Category.create(name: "Nightshade")

      @fake_product = Product.create(name: "Denethorian Tomato", price_cents: 9999, quantity: 4, category: nil)

      expect(@fake_product.category).to be_nil
      expect(@fake_product.errors.full_messages).to include "Category can't be blank"

    end


  end
end
