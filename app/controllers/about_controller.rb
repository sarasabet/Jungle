class AboutController < ApplicationController
  def index 
    @product = Product.count
    @category = Product
  end
end
