require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should exist after being created with a name, price, quantity, and category." do
      
      @fake_category = Category.new(name: "Nightshade")
      @fake_category.save

      @fake_product = Product.new(name: "Denethorian Tomato", price_cents: 1799, quantity: 700, category: @fake_category)
      @fake_product.save

      expect(@fake_product).to be_valid

    end
    
    it "should have a name" do
      @fake_category = Category.new(name: "Nightshade")
      @fake_category.save

      @fake_product = Product.new(name: nil, price_cents: 1799, quantity: 700, category: @fake_category)
      @fake_product.save

      expect(@fake_product.name).to be_nil

      # logs the error to console if there is one
      puts @fake_product.errors.full_messages

      # checks that the error matches if name is provided as nil
      expect(@fake_product.errors.full_messages).to include "Name can't be blank"

    end

    it "should have a price" do
      
      @fake_category = Category.new(name: "Nightshade")
      @fake_category.save

      @fake_product = Product.new(name: "Denethorian Tomato", price_cents: nil, quantity: 700, category: @fake_category)
      @fake_product.save

      # logs the error to console if there is one
      puts @fake_product.errors.full_messages

      expect(@fake_product.price).to be_nil
      expect(@fake_product.errors.full_messages).to include "Price can't be blank"

    end

    it "should have a quantity" do
      
      @fake_category = Category.new(name: "Nightshade")
      @fake_category.save

      @fake_product = Product.new(name: "Denethorian Tomato", price_cents: 9999, quantity: nil, category: @fake_category)
      @fake_product.save

      # logs the error to console if there is one
      puts @fake_product.errors.full_messages

      expect(@fake_product.quantity).to be_nil
      expect(@fake_product.errors.full_messages).to include "Quantity can't be blank"

    end


    it "should have a category" do
      
      @fake_category = Category.new(name: "Nightshade")
      @fake_category.save

      @fake_product = Product.new(name: "Denethorian Tomato", price_cents: 9999, quantity: 4, category: nil)
      @fake_product.save

      # logs the error to console if there is one
      puts @fake_product.errors.full_messages

      expect(@fake_product.category).to be_nil
      expect(@fake_product.errors.full_messages).to include "Category can't be blank"

    end


  end
end
