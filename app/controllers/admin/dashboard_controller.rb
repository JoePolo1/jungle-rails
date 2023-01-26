class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMINUN'], password: ENV['ADMINPW']


  def show
  end
end
