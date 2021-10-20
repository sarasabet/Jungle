# require 'rails_helper'

# RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

#   # SETUP
#   before :each do
#     @category = Category.create! name: 'Apparel'

#     10.times do |n|
#       @category.products.create!(
#         name:  Faker::Hipster.sentence(3),
#         description: Faker::Hipster.paragraph(4),
#         image: open_asset('apparel1.jpg'),
#         quantity: 10,
#         price: 64.99
#       )

#     end
#   end

#   scenario "They see the product detail page" do
#     # ACT
#     visit root_path
#     # to get the first child of article 
#     # first('article.product img').click
#     all('article.product img').first.click

#     #DEBUG
#     sleep 5
#     save_screenshot
    
#     # VERIFY
#     #  havetext/have_content are same 
#     expect(page).to have_text("#{@category.name} » #{Product.last.name}")
#     expect(page).to have_content("#{@category.name} » #{Product.last.name}")
 
   
#   end
# end