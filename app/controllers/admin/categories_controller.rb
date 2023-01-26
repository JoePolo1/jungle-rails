class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMINUN'], password: ENV['ADMINPW']

  

end
