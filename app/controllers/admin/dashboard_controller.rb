class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMINUN'], password: ENV['ADMINPW']

  def show
    @product_count = Product.count
    @category_tally = Category.count
    @product_quantity_total = Product.sum(:quantity)
  end

end
