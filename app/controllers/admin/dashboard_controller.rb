class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @product_count = Product.count

    @category_count= Product.select("category_id").group("category_id")
    @category_name= Category.select("name").group("name")
    
 

  end
end
