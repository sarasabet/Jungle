class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show

    @product = Product.find params[:id]
    @test = "Hello from heer!"
    puts "HERE"

  end

end
