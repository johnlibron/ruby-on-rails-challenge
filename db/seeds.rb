# Clear existing data
Product.delete_all
User.delete_all

# Create users
users = [
  { name: 'Alice Johnson', email: 'alice@example.com', age: 28, city: 'New York' },
  { name: 'Bob Smith', email: 'bob@example.com', age: 35, city: 'London' },
  { name: 'Charlie Brown', email: 'charlie@example.com', age: 22, city: 'Chicago' },
  { name: 'Diana Prince', email: 'diana@example.com', age: 30, city: 'Paris' },
  { name: 'Eve Wilson', email: 'eve@example.com', age: 26, city: 'Berlin' }
]

created_users = users.map { |user_attrs| User.create!(user_attrs) }

# Create products
products = [
  { name: 'Laptop', description: 'High-performance laptop', price: 1200.00 },
  { name: 'Mouse', description: 'Wireless mouse', price: 25.99 },
  { name: 'Keyboard', description: 'Mechanical keyboard', price: 89.99 },
  { name: 'Monitor', description: '4K display monitor', price: 350.00 },
  { name: 'Webcam', description: 'HD webcam', price: 75.00 },
  { name: 'Headphones', description: 'Noise-cancelling headphones', price: 150.00 },
  { name: 'Tablet', description: '10-inch tablet', price: 299.99 },
  { name: 'Phone Case', description: 'Protective phone case', price: 19.99 },
  { name: 'Charger', description: 'Fast charging cable', price: 29.99 },
  { name: 'Speaker', description: 'Bluetooth speaker', price: 89.99 }
]

products.each_with_index do |product_attrs, index|
  user = created_users[index % created_users.length]
  user.products.create!(product_attrs)
end

puts "Created #{User.count} users and #{Product.count} products"