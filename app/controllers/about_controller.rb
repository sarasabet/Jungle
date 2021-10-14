class AboutController < ApplicationController
  def index 
    @product = Product.count
  end
end
