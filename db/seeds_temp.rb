# db/seeds.rb

require 'faker'

# Clear existing data
[Company, Product, Ingredient, Inventory, Pricing, Promotion, Sale, Forecast, Feedback,
 Merchandising, PurchaseOrder, Region, SalesTarget, Store, User, Service].each(&:destroy_all)

all_supplier_products = {
  101 => {
    name: 'Yellow Corn',
    description:
      'High-quality yellow corn for animal feed and milling purposes.',
    sku: 'YC123',
    price: 150,
    cost: 100,
    stock_quantity: 1000,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 50,
    reorder_level: 200,
    reorder_quantity: 500,
    unit_of_measure: 'kg',
    expiration_date: '2024-12-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'USDA Certified',
    hazardous_material: false
  },
  102 => {
    name: 'White Corn',
    description:
      'Premium white corn ideal for various food products and animal feed.',
    sku: 'WC456',
    price: 160,
    cost: 110,
    stock_quantity: 800,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 50,
    reorder_level: 150,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-01-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'USDA Certified',
    hazardous_material: false
  },
  103 => {
    name: 'Soybeans',
    description:
      'High-protein soybeans suitable for livestock feed and oil extraction.',
    sku: 'SB789',
    price: 200,
    cost: 150,
    stock_quantity: 1200,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 50,
    reorder_level: 250,
    reorder_quantity: 600,
    unit_of_measure: 'kg',
    expiration_date: '2024-11-30T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Non-GMO Certified',
    hazardous_material: false
  }
}

# Create Internal Companies
internal_companies = [
  {
    first_name: 'John',
    last_name: 'Williams',
    email: 'john.williams@westernmilling.com',
    phone_number: '559-123-4567',
    company_name: 'Western Milling Agribusiness',
    address_line1: '123 Agronomy St',
    address_line2: '',
    city: 'Hanford',
    state: 'CA',
    postal_code: '93230',
    country: 'USA',
    is_supplier: false,
    is_customer: false,
    is_internal: true,
    products: [
      {
        name: 'Complete Dairy Feed',
        description: 'High-quality complete feed for dairy cows to ensure optimal milk production and health.',
        sku: 'WM-DAIRY-001',
        company_id: 1,
        price: 25.5,
        cost: 15.0,
        stock_quantity: 1000,
        sales_count: 200,
        product_type: 'wm_product',
        last_sale_date: '2024-06-15T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 111, weight_needed_per_batch: 1.5, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 1.2, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 2.5, unit_of_measure: 'kg' },
          { supplier_product_key: 119, weight_needed_per_batch: 0.05, unit_of_measure: 'kg' },
          { supplier_product_key: 120, weight_needed_per_batch: 0.03, unit_of_measure: 'kg' },
          { supplier_product_key: 121, weight_needed_per_batch: 0.04, unit_of_measure: 'kg' },
          { supplier_product_key: 123, weight_needed_per_batch: 0.01, unit_of_measure: 'kg' },
          { supplier_product_key: 125, weight_needed_per_batch: 0.02, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Broiler Starter Feed',
        description: 'Nutrient-rich starter feed for broiler chickens to promote healthy growth.',
        sku: 'WM-BROILER-002',
        company_id: 1,
        price: 18.75,
        cost: 10.5,
        stock_quantity: 500,
        sales_count: 150,
        product_type: 'wm_product',
        last_sale_date: '2024-06-12T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 130, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 120, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 136, weight_needed_per_batch: 1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Layer Pellet Feed',
        description: 'Pelleted feed for layer hens to ensure maximum egg production and quality.',
        sku: 'WM-LAYER-003',
        company_id: 1,
        price: 20.0,
        cost: 12.0,
        stock_quantity: 800,
        sales_count: 300,
        product_type: 'wm_product',
        last_sale_date: '2024-06-10T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 300, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 150, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 126, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 129, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 130, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 123, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' }
        ]
      }
    ]
  },
  {
    first_name: 'Samantha',
    last_name: 'Beckwith',
    email: 'sam.beckwith@ohkruse.com',
    phone_number: '559-234-5678',
    company_name: 'OH Kruse Grain and Milling',
    address_line1: '456 Feed Ln',
    address_line2: '',
    city: 'Visalia',
    state: 'CA',
    postal_code: '93291',
    country: 'USA',
    is_supplier: false,
    is_customer: false,
    is_internal: true,
    products: [
      {
        name: 'Premium Horse Feed',
        description: 'High-fiber feed specially formulated for horses to ensure peak performance and health.',
        sku: 'OHK-HORSE-001',
        category_id: 1,
        company_id: 2,
        price: 27.0,
        cost: 18.0,
        stock_quantity: 800,
        sales_count: 120,
        product_type: 'wm_product',
        last_sale_date: '2024-06-10T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 8, unit_of_measure: 'kg' },
          { supplier_product_key: 113, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 136, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Poultry Starter Feed',
        description: 'Nutrient-rich starter feed for poultry to support rapid and healthy growth.',
        sku: 'OHK-POULTRY-002',
        category_id: 1,
        company_id: 2,
        price: 19.0,
        cost: 11.5,
        stock_quantity: 600,
        sales_count: 180,
        product_type: 'wm_product',
        last_sale_date: '2024-06-11T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 102, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 150, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 116, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 117, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 119, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 120, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 121, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 122, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 124, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 126, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 130, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 133, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 136, weight_needed_per_batch: 1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Rabbit Pellets',
        description: 'Complete pelleted feed for rabbits to promote overall health and growth.',
        sku: 'OHK-RABBIT-003',
        category_id: 1,
        company_id: 2,
        price: 16.0,
        cost: 9.5,
        stock_quantity: 400,
        sales_count: 140,
        product_type: 'wm_product',
        last_sale_date: '2024-06-12T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 103, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 106, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 131, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' },
          { supplier_product_key: 133, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' },
          { supplier_product_key: 135, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' },
          { supplier_product_key: 137, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' }
        ]
      }
    ]
  }
]

internal_companies.each do |company_data|
  company = Company.create!(
    first_name: company_data[:first_name],
    last_name: company_data[:last_name],
    email: company_data[:email],
    phone_number: company_data[:phone_number],
    company_name: company_data[:company_name],
    address_line1: company_data[:address_line1],
    address_line2: company_data[:address_line2],
    city: company_data[:city],
    state: company_data[:state],
    postal_code: company_data[:postal_code],
    country: company_data[:country],
    isSupplier: company_data[:isSupplier],
    isCustomer: company_data[:isCustomer],
    isInternal: company_data[:isInternal]
  )

  company_data[:products].each do |product_data|
    product = company.products.create!(
      name: product_data[:name],
      description: product_data[:description],
      sku: product_data[:sku],
      price: product_data[:price],
      cost: product_data[:cost],
      stock_quantity: product_data[:stock_quantity],
      sales_count: product_data[:sales_count],
      product_type: product_data[:product_type],
      last_sale_date: product_data[:last_sale_date]
    )

    product_data[:ingredients].each do |ingredient_data|
      product.ingredients.create!(
        weight_needed_per_batch: ingredient_data[:weight_needed_per_batch],
        unit_of_measure: ingredient_data[:unit_of_measure]
      )
    end
  end
end

# Create Supplier Companies
supplier_companies = [
  {
    first_name: 'Ernie',
    last_name: 'Roncoroni',
    email: 'contact@growwest.com',
    phone_number: '(530) 662-5442',
    company_name: 'Grow West',
    address_line1: '201 East Street',
    address_line2: '',
    city: 'Woodland',
    state: 'CA',
    postal_code: '95776',
    country: 'USA',
    isSupplier: true,
    isCustomer: true,
    productKeys: %w[
      139
      140
      141
      142
      143
      144
      145
      146
      147
      148
      149
      150
      151
      152
      153
      154
      155
      156
      157
      158
      159
      160
      161
      162
      163
      164
      165
      166
      167
      168
      169
      170
      171
      172
      173
      174
      175
      176
      177
      178
      179
      180
      181
      182
      183
      184
      185
      186
      187
      188
      189
      190
      191
      192
      193
      194
      195
      196
      197
      198
      199
      200
    ]
  },
  {
    first_name: 'John',
    last_name: 'Doe',
    email: 'info@bwcag.com',
    phone_number: '(661) 831-3416',
    company_name: 'Buttonwillow Warehouse Co.',
    address_line1: '14762 Pieri Rd',
    address_line2: '',
    city: 'Bakersfield',
    state: 'CA',
    postal_code: '93311',
    country: 'USA',
    isSupplier: true,
    isCustomer: false,
    productKeys: %w[
      139
      140
      141
      142
      143
      144
      161
      162
      163
      164
      165
      166
      167
      168
      169
      170
      171
    ]
  },
  {
    first_name: 'Jane',
    last_name: 'Smith',
    email: 'info@midvalleyag.com',
    phone_number: '(209) 847-2266',
    company_name: 'Mid Valley Agricultural Services',
    address_line1: '123 Main Street',
    address_line2: '',
    city: 'Oakdale',
    state: 'CA',
    postal_code: '95361',
    country: 'USA',
    isSupplier: true,
    isCustomer: false,
    productKeys: %w[
      139
      140
      141
      142
      143
      144
      145
      146
      147
      148
      149
      150
      151
      152
      153
      154
      155
      156
      157
      158
      159
      160
      161
      162
      163
      164
      165
      166
      167
      168
      169
      170
      171
      172
      173
      174
      175
      176
      177
      178
      179
      180
      181
      182
      183
      184
      185
      186
      187
      188
      189
      190
      191
      192
      193
      194
      195
      196
      197
      198
      199
      200
    ]
  }
]

# Method to generate random dates within the past and future 3 months
def random_date_within_3_months
  start_date = 3.months.ago.to_date
  end_date = 3.months.from_now.to_date
  rand(start_date..end_date)
end

# Method to randomize a value within +/- 20%
def randomize_value(value)
  min_value = value * 0.8
  max_value = value * 1.2
  rand(min_value..max_value)
end

supplier_companies.each do |company_data|
  company = Company.create!(
    first_name: company_data[:first_name],
    last_name: company_data[:last_name],
    email: company_data[:email],
    phone_number: company_data[:phone_number],
    company_name: company_data[:company_name],
    address_line1: company_data[:address_line1],
    address_line2: company_data[:address_line2],
    city: company_data[:city],
    state: company_data[:state],
    postal_code: company_data[:postal_code],
    country: company_data[:country],
    isSupplier: company_data[:isSupplier],
    isCustomer: company_data[:isCustomer],
    isInternal: false
  )

  company_data[:productKeys].each do |product_key|
    product_data = all_supplier_products[product_key.to_i]
    company.products.create!(
      name: product_data[:name],
      description: product_data[:description],
      sku: product_data[:sku],
      price: randomize_value(product_data[:price]),
      cost: randomize_value(product_data[:cost]),
      stock_quantity: randomize_value(product_data[:stock_quantity]),
      product_type: product_data[:product_type],
      min_lead_time: randomize_value(product_data[:min_lead_time]),
      min_order_quantity: randomize_value(product_data[:min_order_quantity]),
      reorder_level: product_data[:reorder_level],
      reorder_quantity: product_data[:reorder_quantity],
      unit_of_measure: product_data[:unit_of_measure],
      expiration_date: product_data[:expiration_date],
      weight: product_data[:weight],
      dimensions: product_data[:dimensions],
      storage_conditions: product_data[:storage_conditions],
      product_origin: product_data[:product_origin],
      certifications: product_data[:certifications],
      hazardous_material: product_data[:hazardous_material]
    )

    # Creating purchase orders for the company
    30.times do
      PurchaseOrder.create!(
        company_id: company.id,
        order_number: Faker::Number.unique.number(digits: 10),
        order_date: random_date_within_3_months,
        delivery_date: random_date_within_3_months,
        total_amount: Faker::Commerce.price(range: 1000..10_000),
        status: %w[Pending Shipped Delivered Cancelled].sample
      )
    end
  end
end

puts 'Seeding completed successfully!'
