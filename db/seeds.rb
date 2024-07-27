require 'faker'

# Create categories
categories = []
5.times do
  categories << Category.create!(
    name: Faker::Commerce.department,
    description: Faker::Lorem.sentence
  )
end

# Create suppliers
suppliers = []
5.times do
  suppliers << Supplier.create!(
    name: Faker::Company.name,
    contact_name: Faker::Name.name,
    contact_email: Faker::Internet.email,
    contact_phone: Faker::PhoneNumber.phone_number,
    address_line1: Faker::Address.street_address,
    address_line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    postal_code: Faker::Address.zip_code,
    country: Faker::Address.country
  )
end

# Create products
products = []
10.times do
  products << Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    sku: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3),
    category: categories.sample,
    supplier: suppliers.sample,
    price: Faker::Commerce.price,
    cost: Faker::Commerce.price,
    stock_quantity: Faker::Number.between(from: 1, to: 100)
  )
end

# Create companies
companies = []
10.times do
  companies << Company.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    company_name: Faker::Company.name,
    address_line1: Faker::Address.street_address,
    address_line2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    postal_code: Faker::Address.zip_code,
    country: Faker::Address.country
  )
end

# Create users
users = []
5.times do
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: '1234ABCDE',
    password_digest: BCrypt::Password.create('password'),
    role: %w[admin user].sample,
    status: 'active',
    reset_password_token: nil,
    reset_password_sent_at: nil,
    last_login_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# Create sales
sales = []
20.times do
  sales << Sale.create!(
    company: companies.sample,
    total_amount: Faker::Commerce.price(range: 50..1000),
    sale_date: Faker::Date.between(from: 1.year.ago, to: Time.zone.today),
    status: %w[completed pending cancelled].sample
  )
end

# Create sales details
sales.each do |sale|
  rand(1..5).times do
    product = products.sample
    quantity = Faker::Number.between(from: 1, to: 10)
    unit_price = product.price
    total_price = unit_price * quantity

    SalesDetail.create!(
      sale: sale,
      product: product,
      quantity: quantity,
      unit_price: unit_price,
      total_price: total_price
    )
  end
end

# Create merchandisings
10.times do
  Merchandising.create!(
    product: products.sample,
    activity_type: %w[discount promotion clearance].sample,
    description: Faker::Lorem.sentence,
    start_date: Faker::Date.between(from: 1.year.ago, to: Time.zone.today),
    end_date: Faker::Date.forward(days: 30),
    discount_percentage: Faker::Number.between(from: 5, to: 50)
  )
end

# Create inventories
products.each do |product|
  Inventory.create!(
    product: product,
    quantity_on_hand: Faker::Number.between(from: 50, to: 500),
    reorder_level: Faker::Number.between(from: 10, to: 50),
    reorder_quantity: Faker::Number.between(from: 20, to: 100),
    location: Faker::Address.city
  )

  # Create pricings
  Pricing.create!(
    product: product,
    price: product.price,
    start_date: Faker::Date.between(from: 1.year.ago, to: Time.zone.today),
    end_date: Faker::Date.forward(days: 30)
  )
end

# Create promotions
5.times do
  Promotion.create!(
    name: Faker::Commerce.promotion_code,
    description: Faker::Lorem.paragraph,
    discount_type: %w[percentage fixed].sample,
    discount_value: Faker::Commerce.price(range: 5..50),
    start_date: Faker::Date.between(from: 1.month.ago, to: Time.zone.today),
    end_date: Faker::Date.forward(days: 30),
    product: products.sample
  )
end

# Create forecasts
products.each do |product|
  Forecast.create!(
    forecast_type: 'sales',
    product: product,
    forecast_period: 'monthly',
    forecast_date: Faker::Date.between(from: Time.zone.today, to: 1.year.from_now),
    forecast_value: Faker::Commerce.price(range: 1000..5000)
  )
end

# Create feedbacks
20.times do
  Feedback.create!(
    company: companies.sample,
    product: products.sample,
    rating: Faker::Number.between(from: 1, to: 5),
    comment: Faker::Lorem.paragraph
  )
end

# Create sales targets
products.each do |product|
  SalesTarget.create!(
    product: product,
    region: Region.create!(name: Faker::Address.state, description: Faker::Lorem.sentence),
    store: Store.create!(
      name: Faker::Company.name,
      region: Region.last,
      address_line1: Faker::Address.street_address,
      address_line2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      postal_code: Faker::Address.zip_code,
      country: Faker::Address.country,
      phone_number: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email
    ),
    target_period: 'monthly',
    target_amount: Faker::Commerce.price(range: 1000..5000),
    achieved_amount: Faker::Commerce.price(range: 500..2500),
    start_date: Faker::Date.between(from: 1.year.ago, to: Time.zone.today),
    end_date: Faker::Date.forward(days: 30)
  )
end
