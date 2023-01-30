require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should exist after being created with a name, price, quantity, and category." do
      
      @fake_category = Category.new(name: "Nightshade")
      @fake_category.save

      @fake_product = Product.new(name: "Denethorian Tomato", price: 1799, quantity: 700, category: @fake_category)
      @fake_product.save

      expect(@fake_product).to be_valid

    end
    
    # it "should have a name"



  end
end
