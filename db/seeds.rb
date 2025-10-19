# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Clear existing products
Product.destroy_all

# Create sample products
Product.create!([
  {
    name: 'MacBook Pro',
    description: '16-inch MacBook Pro with M2 Pro chip',
    price: 2499.99,
    stock_quantity: 15
  },
  {
    name: 'iPhone 15',
    description: 'Latest iPhone with Dynamic Island',
    price: 999.99,
    stock_quantity: 30
  },
  {
    name: 'AirPods Pro',
    description: 'Wireless earbuds with active noise cancellation',
    price: 249.99,
    stock_quantity: 50
  },
  {
    name: 'iPad Air',
    description: 'Powerful iPad with M1 chip',
    price: 599.99,
    stock_quantity: 20
  },
  {
    name: 'Apple Watch',
    description: 'Series 8 with health monitoring features',
    price: 399.99,
    stock_quantity: 25
  }
])

puts "✅ Sample products created successfully!"
