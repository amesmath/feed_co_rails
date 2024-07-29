# db/seeds.rb

require 'faker'
require 'securerandom'

# Clear existing data
[Company, Product, Ingredient, Inventory, Pricing, Promotion, Sale, Forecast, Feedback,
 Merchandising, PurchaseOrder, Region, SalesTarget, Store, User, Service].each(&:destroy_all)

User.create(email: 'demo@example.com', password: 'password', password_confirmation: 'password')


# Method to generate a unique SKU with a random suffix
def generate_unique_sku
  "#{SecureRandom.alphanumeric(12)}"
end

# Method to randomize a value within +/- 20%
def randomize_value(value)
  min_value = value * 0.8
  max_value = value * 1.2
  rand(min_value..max_value)
end

all_supplier_products = {
  101 => {
    name: 'Yellow Corn',
    description:
      'High-quality yellow corn for animal feed and milling purposes.',
    sku: generate_unique_sku,
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
    sku: generate_unique_sku,
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
    sku: generate_unique_sku,
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
  },
  104 => {
    name: 'Wheat Grain',
    description: 'Top-grade wheat grain for milling and feed applications.',
    sku: generate_unique_sku,
    price: 180,
    cost: 130,
    stock_quantity: 1100,
    product_type: 'supplier',
    min_lead_time: 8,
    min_order_quantity: 50,
    reorder_level: 200,
    reorder_quantity: 500,
    unit_of_measure: 'kg',
    expiration_date: '2025-02-28T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'Canada',
    certifications: 'USDA Certified',
    hazardous_material: false
  },
  105 => {
    name: 'Barley Grain',
    description:
      'High-quality barley grain for brewing, feed, and food products.',
    sku: generate_unique_sku,
    price: 170,
    cost: 120,
    stock_quantity: 900,
    product_type: 'supplier',
    min_lead_time: 6,
    min_order_quantity: 50,
    reorder_level: 180,
    reorder_quantity: 450,
    unit_of_measure: 'kg',
    expiration_date: '2024-10-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Non-GMO Certified',
    hazardous_material: false
  },
  106 => {
    name: 'Oats Grain',
    description: 'Premium oats grain for feed and food processing.',
    sku: generate_unique_sku,
    price: 190,
    cost: 140,
    stock_quantity: 850,
    product_type: 'supplier',
    min_lead_time: 9,
    min_order_quantity: 50,
    reorder_level: 170,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2024-12-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Organic Certified',
    hazardous_material: false
  },
  107 => {
    name: 'Sorghum',
    description: 'Versatile sorghum grain for animal feed and food products.',
    sku: generate_unique_sku,
    price: 175,
    cost: 125,
    stock_quantity: 950,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 50,
    reorder_level: 190,
    reorder_quantity: 450,
    unit_of_measure: 'kg',
    expiration_date: '2025-01-15T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Non-GMO Certified',
    hazardous_material: false
  },
  108 => {
    name: 'Canola Seeds',
    description: 'High-oil content canola seeds for oil extraction and feed.',
    sku: generate_unique_sku,
    price: 210,
    cost: 160,
    stock_quantity: 700,
    product_type: 'supplier',
    min_lead_time: 12,
    min_order_quantity: 50,
    reorder_level: 140,
    reorder_quantity: 350,
    unit_of_measure: 'kg',
    expiration_date: '2025-03-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'Canada',
    certifications: 'USDA Certified',
    hazardous_material: false
  },
  109 => {
    name: 'Sunflower Seeds',
    description: 'Nutrient-rich sunflower seeds for oil extraction and feed.',
    sku: generate_unique_sku,
    price: 220,
    cost: 170,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 50,
    reorder_level: 120,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2025-04-30T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Organic Certified',
    hazardous_material: false
  },
  110 => {
    name: 'Flaxseed',
    description:
      'Nutrient-rich flaxseed for livestock feed and oil extraction.',
    sku: generate_unique_sku,
    price: 230,
    cost: 180,
    stock_quantity: 500,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 30,
    reorder_level: 100,
    reorder_quantity: 250,
    unit_of_measure: 'kg',
    expiration_date: '2025-05-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'Canada',
    certifications: 'Organic Certified',
    hazardous_material: false
  },
  111 => {
    name: 'Rice Bran',
    description: 'High-energy rice bran for livestock feed.',
    sku: generate_unique_sku,
    price: 190,
    cost: 140,
    stock_quantity: 700,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 40,
    reorder_level: 140,
    reorder_quantity: 350,
    unit_of_measure: 'kg',
    expiration_date: '2025-04-30T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'USDA Certified',
    hazardous_material: false
  },
  112 => {
    name: 'Cottonseed',
    description: 'High-fiber cottonseed for dairy and beef cattle feed.',
    sku: generate_unique_sku,
    price: 250,
    cost: 200,
    stock_quantity: 400,
    product_type: 'supplier',
    min_lead_time: 12,
    min_order_quantity: 20,
    reorder_level: 80,
    reorder_quantity: 200,
    unit_of_measure: 'kg',
    expiration_date: '2025-06-30T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Non-GMO Certified',
    hazardous_material: false
  },
  113 => {
    name: 'Beet Pulp',
    description: 'Fiber-rich beet pulp for horse and cattle feed.',
    sku: generate_unique_sku,
    price: 160,
    cost: 120,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 8,
    min_order_quantity: 30,
    reorder_level: 120,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2025-03-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'USDA Certified',
    hazardous_material: false
  },
  114 => {
    name: 'Distillers Dried Grains (DDGs)',
    description: 'High-protein DDGs for livestock feed.',
    sku: generate_unique_sku,
    price: 180,
    cost: 130,
    stock_quantity: 800,
    product_type: 'supplier',
    min_lead_time: 9,
    min_order_quantity: 40,
    reorder_level: 160,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-04-30T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Non-GMO Certified',
    hazardous_material: false
  },
  115 => {
    name: 'Whole Corn',
    description: 'Whole corn kernels for animal feed and milling.',
    sku: generate_unique_sku,
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
  116 => {
    name: 'Cracked Corn',
    description: 'Cracked corn for easier consumption by livestock.',
    sku: generate_unique_sku,
    price: 160,
    cost: 110,
    stock_quantity: 900,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 50,
    reorder_level: 180,
    reorder_quantity: 450,
    unit_of_measure: 'kg',
    expiration_date: '2025-01-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'USDA Certified',
    hazardous_material: false
  },
  117 => {
    name: 'Rolled Oats',
    description: 'Rolled oats for animal feed and food products.',
    sku: generate_unique_sku,
    price: 190,
    cost: 140,
    stock_quantity: 850,
    product_type: 'supplier',
    min_lead_time: 9,
    min_order_quantity: 50,
    reorder_level: 170,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2024-12-31T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Organic Certified',
    hazardous_material: false
  },
  118 => {
    name: 'Millet',
    description: 'Nutrient-rich millet for bird feed and food products.',
    sku: generate_unique_sku,
    price: 210,
    cost: 160,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 50,
    reorder_level: 120,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2025-02-28T00:00:00Z',
    weight: 50,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'Non-GMO Certified',
    hazardous_material: false
  },
  119 => {
    name: 'Vitamin A Supplement',
    description: 'Vitamin A supplement for livestock nutrition.',
    sku: generate_unique_sku,
    price: 300,
    cost: 250,
    stock_quantity: 300,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 20,
    reorder_level: 60,
    reorder_quantity: 150,
    unit_of_measure: 'kg',
    expiration_date: '2025-06-30T00:00:00Z',
    weight: 25,
    dimensions: '40x30x20 cm',
    storage_conditions: 'Dry and cool place',
    product_origin: 'USA',
    certifications: 'FDA Approved',
    hazardous_material: false
  },
  120 => {
    name: 'Vitamin D3 Supplement',
    description:
      'A high-quality Vitamin D3 supplement used to enhance animal nutrition.',
    sku: generate_unique_sku,
    price: 50,
    cost: 40,
    stock_quantity: 200,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 10,
    reorder_level: 50,
    reorder_quantity: 100,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 1,
    dimensions: '10x10x10 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'GMP, ISO 9001',
    hazardous_material: false
  },
  121 => {
    name: 'Vitamin E Supplement',
    description: 'A premium Vitamin E supplement to boost animal health.',
    sku: generate_unique_sku,
    price: 45,
    cost: 35,
    stock_quantity: 180,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 10,
    reorder_level: 40,
    reorder_quantity: 80,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 1,
    dimensions: '10x10x10 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'GMP, ISO 9001',
    hazardous_material: false
  },
  122 => {
    name: 'Calcium Carbonate',
    description: 'Essential calcium carbonate supplement for livestock feed.',
    sku: generate_unique_sku,
    price: 30,
    cost: 25,
    stock_quantity: 500,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 20,
    reorder_level: 100,
    reorder_quantity: 200,
    unit_of_measure: 'kg',
    expiration_date: '2026-06-30T00:00:00Z',
    weight: 1.5,
    dimensions: '15x15x15 cm',
    storage_conditions: 'Dry place',
    product_origin: 'Canada',
    certifications: 'ISO 22000',
    hazardous_material: false
  },
  123 => {
    name: 'Sodium Selenite',
    description: 'High-purity sodium selenite for animal feed applications.',
    sku: generate_unique_sku,
    price: 75,
    cost: 65,
    stock_quantity: 150,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 5,
    reorder_level: 30,
    reorder_quantity: 60,
    unit_of_measure: 'kg',
    expiration_date: '2024-12-31T00:00:00Z',
    weight: 1.2,
    dimensions: '12x12x12 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Germany',
    certifications: 'GMP',
    hazardous_material: false
  },
  124 => {
    name: 'Copper Sulfate',
    description: 'Effective copper sulfate for boosting livestock health.',
    sku: generate_unique_sku,
    price: 55,
    cost: 45,
    stock_quantity: 250,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 15,
    reorder_level: 60,
    reorder_quantity: 120,
    unit_of_measure: 'kg',
    expiration_date: '2025-11-30T00:00:00Z',
    weight: 1.3,
    dimensions: '13x13x13 cm',
    storage_conditions: 'Dry place',
    product_origin: 'USA',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  125 => {
    name: 'Zinc Oxide',
    description: 'High-grade zinc oxide for animal nutritional needs.',
    sku: generate_unique_sku,
    price: 65,
    cost: 55,
    stock_quantity: 300,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 10,
    reorder_level: 70,
    reorder_quantity: 140,
    unit_of_measure: 'kg',
    expiration_date: '2025-08-31T00:00:00Z',
    weight: 1.4,
    dimensions: '14x14x14 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'China',
    certifications: 'GMP',
    hazardous_material: false
  },
  126 => {
    name: 'Manganese Sulfate',
    description: 'Essential manganese sulfate for animal nutrition.',
    sku: generate_unique_sku,
    price: 70,
    cost: 60,
    stock_quantity: 170,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 8,
    reorder_level: 40,
    reorder_quantity: 80,
    unit_of_measure: 'kg',
    expiration_date: '2026-01-31T00:00:00Z',
    weight: 1.6,
    dimensions: '16x16x16 cm',
    storage_conditions: 'Dry place',
    product_origin: 'India',
    certifications: 'ISO 22000',
    hazardous_material: false
  },
  127 => {
    name: 'Potassium Iodide',
    description: 'High-purity potassium iodide for feed applications.',
    sku: generate_unique_sku,
    price: 80,
    cost: 70,
    stock_quantity: 130,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 5,
    reorder_level: 30,
    reorder_quantity: 60,
    unit_of_measure: 'kg',
    expiration_date: '2024-09-30T00:00:00Z',
    weight: 1.1,
    dimensions: '11x11x11 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Japan',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  128 => {
    name: 'Cobalt Carbonate',
    description:
      'Cobalt carbonate for animal feed to enhance nutritional value.',
    sku: generate_unique_sku,
    price: 85,
    cost: 75,
    stock_quantity: 120,
    product_type: 'supplier',
    min_lead_time: 12,
    min_order_quantity: 6,
    reorder_level: 25,
    reorder_quantity: 50,
    unit_of_measure: 'kg',
    expiration_date: '2025-03-31T00:00:00Z',
    weight: 1.3,
    dimensions: '13x13x13 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Australia',
    certifications: 'ISO 22000',
    hazardous_material: false
  },
  129 => {
    name: 'DL-Methionine',
    description:
      'DL-Methionine amino acid supplement for enhancing feed quality.',
    sku: generate_unique_sku,
    price: 95,
    cost: 85,
    stock_quantity: 110,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 10,
    reorder_level: 20,
    reorder_quantity: 40,
    unit_of_measure: 'kg',
    expiration_date: '2024-11-30T00:00:00Z',
    weight: 1,
    dimensions: '10x10x10 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'GMP, ISO 9001',
    hazardous_material: false
  },
  130 => {
    name: 'L-Lysine',
    description:
      'An essential amino acid used in animal feed for protein synthesis.',
    sku: generate_unique_sku,
    price: 12.5,
    cost: 10,
    stock_quantity: 200,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 20,
    reorder_level: 50,
    reorder_quantity: 100,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 25,
    dimensions: '50x30x10 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'USA',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  131 => {
    name: 'Thiamine Mononitrate (Vitamin B1)',
    description:
      'A vitamin supplement used in animal feed to support metabolic functions.',
    sku: generate_unique_sku,
    price: 30,
    cost: 25,
    stock_quantity: 150,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 10,
    reorder_level: 30,
    reorder_quantity: 50,
    unit_of_measure: 'kg',
    expiration_date: '2024-10-31T00:00:00Z',
    weight: 10,
    dimensions: '40x25x10 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'Canada',
    certifications: 'GMP',
    hazardous_material: false
  },
  132 => {
    name: 'Riboflavin (Vitamin B2)',
    description:
      'A vitamin supplement for animal feed to aid in energy production and growth.',
    sku: generate_unique_sku,
    price: 25,
    cost: 20,
    stock_quantity: 180,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 10,
    reorder_level: 40,
    reorder_quantity: 60,
    unit_of_measure: 'kg',
    expiration_date: '2024-08-31T00:00:00Z',
    weight: 15,
    dimensions: '40x20x15 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'Germany',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  133 => {
    name: 'Niacin (Vitamin B3)',
    description:
      'A vitamin supplement used to improve animal metabolism and health.',
    sku: generate_unique_sku,
    price: 28,
    cost: 22,
    stock_quantity: 120,
    product_type: 'supplier',
    min_lead_time: 12,
    min_order_quantity: 8,
    reorder_level: 25,
    reorder_quantity: 40,
    unit_of_measure: 'kg',
    expiration_date: '2024-11-30T00:00:00Z',
    weight: 12,
    dimensions: '35x20x10 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'China',
    certifications: 'GMP',
    hazardous_material: false
  },
  134 => {
    name: 'Pantothenic Acid (Vitamin B5)',
    description:
      'A vitamin supplement for animal feed to enhance growth and feed efficiency.',
    sku: generate_unique_sku,
    price: 35,
    cost: 28,
    stock_quantity: 100,
    product_type: 'supplier',
    min_lead_time: 15,
    min_order_quantity: 5,
    reorder_level: 20,
    reorder_quantity: 30,
    unit_of_measure: 'kg',
    expiration_date: '2024-09-30T00:00:00Z',
    weight: 10,
    dimensions: '30x20x10 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'India',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  135 => {
    name: 'Pyridoxine Hydrochloride (Vitamin B6)',
    description:
      'A vitamin supplement used to support nervous system and immune function in animals.',
    sku: generate_unique_sku,
    price: 40,
    cost: 32,
    stock_quantity: 90,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 8,
    reorder_level: 18,
    reorder_quantity: 25,
    unit_of_measure: 'kg',
    expiration_date: '2024-10-31T00:00:00Z',
    weight: 11,
    dimensions: '35x20x12 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'USA',
    certifications: 'GMP',
    hazardous_material: false
  },
  136 => {
    name: 'Biotin (Vitamin B7)',
    description:
      'A vitamin supplement to support animal health, particularly skin, coat, and hoof condition.',
    sku: generate_unique_sku,
    price: 50,
    cost: 40,
    stock_quantity: 80,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 5,
    reorder_level: 15,
    reorder_quantity: 20,
    unit_of_measure: 'kg',
    expiration_date: '2024-07-31T00:00:00Z',
    weight: 5,
    dimensions: '25x15x10 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'China',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  137 => {
    name: 'Folic Acid (Vitamin B9)',
    description:
      'A vitamin supplement that aids in cell growth and development in animals.',
    sku: generate_unique_sku,
    price: 45,
    cost: 36,
    stock_quantity: 110,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 10,
    reorder_level: 20,
    reorder_quantity: 30,
    unit_of_measure: 'kg',
    expiration_date: '2024-06-30T00:00:00Z',
    weight: 8,
    dimensions: '30x20x10 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'Germany',
    certifications: 'GMP',
    hazardous_material: false
  },
  138 => {
    name: 'Cyanocobalamin (Vitamin B12)',
    description:
      'A vitamin supplement essential for animal metabolism and nerve function.',
    sku: generate_unique_sku,
    price: 60,
    cost: 48,
    stock_quantity: 70,
    product_type: 'supplier',
    min_lead_time: 12,
    min_order_quantity: 5,
    reorder_level: 10,
    reorder_quantity: 15,
    unit_of_measure: 'kg',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 6,
    dimensions: '25x15x10 cm',
    storage_conditions: 'Store in a cool, dry place',
    product_origin: 'USA',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  139 => {
    name: 'Alfalfa Hay',
    description:
      'A high-quality forage for livestock, rich in protein and fiber.',
    sku: generate_unique_sku,
    price: 200,
    cost: 150,
    stock_quantity: 50,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 10,
    reorder_level: 20,
    reorder_quantity: 30,
    unit_of_measure: 'bale',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 25,
    dimensions: '100x50x50 cm',
    storage_conditions: 'Store in a dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  140 => {
    name: 'Timothy Hay',
    description: 'High-quality timothy hay, ideal for dairy cattle feed.',
    sku: generate_unique_sku,
    price: 200,
    cost: 150,
    stock_quantity: 5000,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 100,
    reorder_level: 1000,
    reorder_quantity: 2000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'USDA Organic',
    hazardous_material: false
  },
  141 => {
    name: 'Agricultural Lime',
    description: 'Agricultural lime to improve soil quality and pH levels.',
    sku: generate_unique_sku,
    price: 50,
    cost: 35,
    stock_quantity: 10_000,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 200,
    reorder_level: 2000,
    reorder_quantity: 4000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  142 => {
    name: 'Dolomitic Lime',
    description: 'Dolomitic lime to supply magnesium and calcium to the soil.',
    sku: generate_unique_sku,
    price: 55,
    cost: 40,
    stock_quantity: 8000,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 200,
    reorder_level: 1500,
    reorder_quantity: 3000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  143 => {
    name: 'Gypsum Powder',
    description: 'Gypsum powder to improve soil structure and drainage.',
    sku: generate_unique_sku,
    price: 45,
    cost: 30,
    stock_quantity: 12_000,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 200,
    reorder_level: 2500,
    reorder_quantity: 5000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  144 => {
    name: 'Rock Phosphate',
    description: 'Rock phosphate for soil fertilization.',
    sku: generate_unique_sku,
    price: 70,
    cost: 55,
    stock_quantity: 6000,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 100,
    reorder_level: 1000,
    reorder_quantity: 2000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  145 => {
    name: 'Bone Meal',
    description: 'Bone meal to provide phosphorus and calcium.',
    sku: generate_unique_sku,
    price: 80,
    cost: 60,
    stock_quantity: 4000,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 100,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  146 => {
    name: 'Blood Meal',
    description: 'Blood meal to provide high nitrogen content.',
    sku: generate_unique_sku,
    price: 90,
    cost: 70,
    stock_quantity: 3000,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 100,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  147 => {
    name: 'Fish Emulsion',
    description: 'Fish emulsion for a high-nitrogen, organic fertilizer.',
    sku: generate_unique_sku,
    price: 100,
    cost: 80,
    stock_quantity: 2000,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 100,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  148 => {
    name: 'Compost',
    description: 'High-quality compost for soil health and fertility.',
    sku: generate_unique_sku,
    price: 30,
    cost: 20,
    stock_quantity: 15_000,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 100,
    reorder_level: 2000,
    reorder_quantity: 5000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  149 => {
    name: 'Peat Moss',
    description: 'Peat moss for soil conditioning and moisture retention.',
    sku: generate_unique_sku,
    price: 40,
    cost: 25,
    stock_quantity: 10_000,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 100,
    reorder_level: 2000,
    reorder_quantity: 4000,
    unit_of_measure: 'tons',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 1000,
    dimensions: '1x1x1 meters per ton',
    storage_conditions: 'Dry, cool place',
    product_origin: 'California, USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  150 => {
    name: 'Vermiculite',
    description:
      'A natural mineral used to improve soil aeration and water retention.',
    sku: generate_unique_sku,
    price: 25,
    cost: 15,
    stock_quantity: 1000,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 100,
    reorder_level: 200,
    reorder_quantity: 500,
    unit_of_measure: 'kg',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 20,
    dimensions: '50x50x30 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  151 => {
    name: 'Perlite',
    description:
      'A volcanic glass that is used in horticulture to improve soil aeration and drainage.',
    sku: generate_unique_sku,
    price: 30,
    cost: 18,
    stock_quantity: 1500,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 200,
    reorder_level: 300,
    reorder_quantity: 600,
    unit_of_measure: 'kg',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 15,
    dimensions: '60x60x40 cm',
    storage_conditions: 'Dry place',
    product_origin: 'Greece',
    certifications: 'Organic',
    hazardous_material: false
  },
  152 => {
    name: 'Humic Acid',
    description:
      'Organic compound used to enhance soil fertility and stimulate plant growth.',
    sku: generate_unique_sku,
    price: 45,
    cost: 25,
    stock_quantity: 800,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 50,
    reorder_level: 100,
    reorder_quantity: 250,
    unit_of_measure: 'kg',
    expiration_date: '2026-12-31T00:00:00Z',
    weight: 25,
    dimensions: '40x40x30 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Canada',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  153 => {
    name: 'Seaweed Extract',
    description:
      'A natural fertilizer derived from seaweed, rich in micronutrients.',
    sku: generate_unique_sku,
    price: 50,
    cost: 30,
    stock_quantity: 500,
    product_type: 'supplier',
    min_lead_time: 21,
    min_order_quantity: 20,
    reorder_level: 50,
    reorder_quantity: 100,
    unit_of_measure: 'liters',
    expiration_date: '2025-06-30T00:00:00Z',
    weight: 10,
    dimensions: '30x30x40 cm',
    storage_conditions: 'Cool, dark place',
    product_origin: 'Norway',
    certifications: 'Organic',
    hazardous_material: false
  },
  154 => {
    name: 'Green Sand',
    description:
      'A natural mineral fertilizer rich in glauconite, used to improve soil structure and provide trace minerals.',
    sku: generate_unique_sku,
    price: 35,
    cost: 20,
    stock_quantity: 1200,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 150,
    reorder_level: 250,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 22,
    dimensions: '50x50x30 cm',
    storage_conditions: 'Dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  155 => {
    name: 'Kelp Meal',
    description:
      'Organic soil amendment made from dried and ground seaweed, used to enrich soil with nutrients.',
    sku: generate_unique_sku,
    price: 40,
    cost: 22,
    stock_quantity: 900,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 75,
    reorder_level: 150,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2026-01-31T00:00:00Z',
    weight: 18,
    dimensions: '40x40x30 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Iceland',
    certifications: 'Organic',
    hazardous_material: false
  },
  156 => {
    name: 'Biochar',
    description:
      'A carbon-rich product used to improve soil fertility and sequester carbon.',
    sku: generate_unique_sku,
    price: 55,
    cost: 35,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 21,
    min_order_quantity: 50,
    reorder_level: 100,
    reorder_quantity: 200,
    unit_of_measure: 'kg',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 20,
    dimensions: '60x60x40 cm',
    storage_conditions: 'Dry place',
    product_origin: 'Brazil',
    certifications: 'Organic',
    hazardous_material: false
  },
  157 => {
    name: 'Mushroom Compost',
    description:
      'A type of organic compost made from the substrate used in mushroom farming, rich in nutrients and beneficial for soil health.',
    sku: generate_unique_sku,
    price: 20,
    cost: 10,
    stock_quantity: 2000,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 300,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'kg',
    expiration_date: '2024-05-31T00:00:00Z',
    weight: 25,
    dimensions: '70x70x50 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  158 => {
    name: 'Cottonseed Meal',
    description:
      'A high-protein feed supplement for livestock, also used as an organic fertilizer.',
    sku: generate_unique_sku,
    price: 28,
    cost: 16,
    stock_quantity: 1100,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 150,
    reorder_level: 250,
    reorder_quantity: 500,
    unit_of_measure: 'kg',
    expiration_date: '2025-03-31T00:00:00Z',
    weight: 30,
    dimensions: '50x50x40 cm',
    storage_conditions: 'Dry place',
    product_origin: 'India',
    certifications: 'Organic',
    hazardous_material: false
  },
  159 => {
    name: 'Alfalfa Meal',
    description:
      'A natural fertilizer and animal feed supplement rich in nitrogen, used to enhance soil fertility.',
    sku: generate_unique_sku,
    price: 32,
    cost: 18,
    stock_quantity: 950,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 100,
    reorder_level: 200,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-09-30T00:00:00Z',
    weight: 20,
    dimensions: '50x50x30 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  160 => {
    name: 'Azomite',
    description:
      'A natural mineral product with trace elements beneficial for plant growth.',
    sku: generate_unique_sku,
    price: 50,
    cost: 30,
    stock_quantity: 200,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 50,
    reorder_level: 100,
    reorder_quantity: 150,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31',
    weight: 25,
    dimensions: '50x40x30 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  161 => {
    name: 'Urea',
    description:
      'A widely used nitrogen fertilizer essential for plant growth.',
    sku: generate_unique_sku,
    price: 20,
    cost: 12,
    stock_quantity: 500,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 100,
    reorder_level: 200,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2024-12-31',
    weight: 50,
    dimensions: '60x40x20 cm',
    storage_conditions: 'Dry, ventilated area',
    product_origin: 'China',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  162 => {
    name: 'Ammonium Nitrate',
    description:
      'A high-nitrogen fertilizer used for accelerating plant growth.',
    sku: generate_unique_sku,
    price: 25,
    cost: 15,
    stock_quantity: 300,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 50,
    reorder_level: 150,
    reorder_quantity: 200,
    unit_of_measure: 'kg',
    expiration_date: '2024-06-30',
    weight: 40,
    dimensions: '55x35x25 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Russia',
    certifications: 'REACH',
    hazardous_material: true
  },
  163 => {
    name: 'Ammonium Sulfate',
    description:
      'A nitrogen fertilizer with sulfur, essential for plant nutrition.',
    sku: generate_unique_sku,
    price: 15,
    cost: 8,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 100,
    reorder_level: 250,
    reorder_quantity: 350,
    unit_of_measure: 'kg',
    expiration_date: '2024-09-30',
    weight: 50,
    dimensions: '60x40x20 cm',
    storage_conditions: 'Dry, ventilated area',
    product_origin: 'USA',
    certifications: 'ISO 14001',
    hazardous_material: false
  },
  164 => {
    name: 'Diammonium Phosphate (DAP)',
    description:
      'A widely used phosphorus fertilizer for promoting root growth.',
    sku: generate_unique_sku,
    price: 30,
    cost: 18,
    stock_quantity: 400,
    product_type: 'supplier',
    min_lead_time: 8,
    min_order_quantity: 75,
    reorder_level: 200,
    reorder_quantity: 250,
    unit_of_measure: 'kg',
    expiration_date: '2025-03-31',
    weight: 45,
    dimensions: '55x35x25 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Morocco',
    certifications: 'GMP',
    hazardous_material: false
  },
  165 => {
    name: 'Monoammonium Phosphate (MAP)',
    description:
      'A phosphorus fertilizer that provides essential nutrients for plant growth.',
    sku: generate_unique_sku,
    price: 28,
    cost: 16,
    stock_quantity: 450,
    product_type: 'supplier',
    min_lead_time: 6,
    min_order_quantity: 80,
    reorder_level: 220,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2024-11-30',
    weight: 40,
    dimensions: '55x35x25 cm',
    storage_conditions: 'Dry, ventilated area',
    product_origin: 'Saudi Arabia',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  166 => {
    name: 'Potassium Chloride (Muriate of Potash)',
    description: 'A potassium fertilizer essential for crop health and growth.',
    sku: generate_unique_sku,
    price: 35,
    cost: 22,
    stock_quantity: 500,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 100,
    reorder_level: 300,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-05-31',
    weight: 50,
    dimensions: '60x40x20 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Canada',
    certifications: 'REACH',
    hazardous_material: false
  },
  167 => {
    name: 'Potassium Sulfate',
    description:
      'A potassium fertilizer with sulfur, promoting plant growth and resilience.',
    sku: generate_unique_sku,
    price: 40,
    cost: 25,
    stock_quantity: 300,
    product_type: 'supplier',
    min_lead_time: 9,
    min_order_quantity: 60,
    reorder_level: 150,
    reorder_quantity: 250,
    unit_of_measure: 'kg',
    expiration_date: '2024-08-31',
    weight: 50,
    dimensions: '60x40x20 cm',
    storage_conditions: 'Dry, ventilated area',
    product_origin: 'Germany',
    certifications: 'ISO 14001',
    hazardous_material: false
  },
  168 => {
    name: 'Calcium Nitrate',
    description:
      'A calcium fertilizer that provides essential nutrients for plant growth.',
    sku: generate_unique_sku,
    price: 22,
    cost: 14,
    stock_quantity: 400,
    product_type: 'supplier',
    min_lead_time: 6,
    min_order_quantity: 90,
    reorder_level: 200,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2024-10-31',
    weight: 45,
    dimensions: '55x35x25 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Norway',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  169 => {
    name: 'Magnesium Sulfate (Epsom Salt)',
    description:
      'A magnesium fertilizer that provides essential nutrients for plant growth.',
    sku: generate_unique_sku,
    price: 18,
    cost: 10,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 80,
    reorder_level: 300,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-02-28',
    weight: 50,
    dimensions: '60x40x20 cm',
    storage_conditions: 'Dry, ventilated area',
    product_origin: 'India',
    certifications: 'REACH',
    hazardous_material: false
  },
  170 => {
    name: 'Triple Superphosphate (TSP)',
    description:
      'A high-phosphorus fertilizer essential for root development and plant growth.',
    sku: generate_unique_sku,
    price: 32,
    cost: 20,
    stock_quantity: 350,
    product_type: 'supplier',
    min_lead_time: 8,
    min_order_quantity: 70,
    reorder_level: 180,
    reorder_quantity: 250,
    unit_of_measure: 'kg',
    expiration_date: '2025-01-31',
    weight: 45,
    dimensions: '55x35x25 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Brazil',
    certifications: 'ISO 9001',
    hazardous_material: false
  },
  171 => {
    name: 'Sulfate of Potash Magnesia (K-Mag)',
    description:
      'A granular fertilizer that provides potassium, magnesium, and sulfur.',
    sku: generate_unique_sku,
    price: 50,
    cost: 30,
    stock_quantity: 500,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 10,
    reorder_level: 100,
    reorder_quantity: 200,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31',
    weight: 25,
    dimensions: '40x30x20 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  172 => {
    name: 'Liquid Fish Fertilizer',
    description: 'Organic liquid fertilizer derived from fish by-products.',
    sku: generate_unique_sku,
    price: 40,
    cost: 25,
    stock_quantity: 300,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 20,
    reorder_level: 50,
    reorder_quantity: 100,
    unit_of_measure: 'L',
    expiration_date: '2024-06-30',
    weight: 1,
    dimensions: '10x10x30 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  173 => {
    name: 'Liquid Kelp Fertilizer',
    description: 'Organic liquid fertilizer derived from kelp.',
    sku: generate_unique_sku,
    price: 45,
    cost: 28,
    stock_quantity: 400,
    product_type: 'supplier',
    min_lead_time: 12,
    min_order_quantity: 15,
    reorder_level: 80,
    reorder_quantity: 150,
    unit_of_measure: 'L',
    expiration_date: '2024-09-30',
    weight: 1.2,
    dimensions: '10x10x30 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Canada',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  174 => {
    name: 'Bone Meal Fertilizer',
    description: 'Organic fertilizer rich in phosphorus and calcium.',
    sku: generate_unique_sku,
    price: 35,
    cost: 20,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 15,
    min_order_quantity: 25,
    reorder_level: 120,
    reorder_quantity: 250,
    unit_of_measure: 'kg',
    expiration_date: '2025-03-31',
    weight: 20,
    dimensions: '40x30x15 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  175 => {
    name: 'Blood Meal Fertilizer',
    description:
      'Organic fertilizer high in nitrogen, made from dried animal blood.',
    sku: generate_unique_sku,
    price: 37,
    cost: 22,
    stock_quantity: 450,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 20,
    reorder_level: 90,
    reorder_quantity: 200,
    unit_of_measure: 'kg',
    expiration_date: '2025-04-30',
    weight: 15,
    dimensions: '40x30x10 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  176 => {
    name: 'Feather Meal',
    description:
      'Organic fertilizer derived from processed chicken feathers, high in nitrogen.',
    sku: generate_unique_sku,
    price: 32,
    cost: 18,
    stock_quantity: 550,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 30,
    reorder_level: 110,
    reorder_quantity: 220,
    unit_of_measure: 'kg',
    expiration_date: '2025-01-31',
    weight: 20,
    dimensions: '40x30x20 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  177 => {
    name: 'Cottonseed Fertilizer',
    description:
      'Organic fertilizer made from cottonseed, rich in nitrogen and potassium.',
    sku: generate_unique_sku,
    price: 28,
    cost: 16,
    stock_quantity: 700,
    product_type: 'supplier',
    min_lead_time: 12,
    min_order_quantity: 35,
    reorder_level: 140,
    reorder_quantity: 280,
    unit_of_measure: 'kg',
    expiration_date: '2025-07-31',
    weight: 25,
    dimensions: '40x30x15 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  178 => {
    name: 'Soybean Meal Fertilizer',
    description:
      'Organic fertilizer made from ground soybeans, high in nitrogen.',
    sku: generate_unique_sku,
    price: 30,
    cost: 18,
    stock_quantity: 650,
    product_type: 'supplier',
    min_lead_time: 10,
    min_order_quantity: 25,
    reorder_level: 130,
    reorder_quantity: 260,
    unit_of_measure: 'kg',
    expiration_date: '2025-02-28',
    weight: 22,
    dimensions: '40x30x15 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  179 => {
    name: 'Manure-based Compost',
    description: 'Compost made from animal manure, rich in organic matter.',
    sku: generate_unique_sku,
    price: 20,
    cost: 12,
    stock_quantity: 1000,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 50,
    reorder_level: 200,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-08-31',
    weight: 30,
    dimensions: '40x30x25 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  180 => {
    name: 'Worm Castings',
    description:
      'Organic fertilizer made from worm castings, rich in nutrients and beneficial microbes.',
    sku: generate_unique_sku,
    price: 55,
    cost: 35,
    stock_quantity: 400,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 15,
    reorder_level: 80,
    reorder_quantity: 150,
    unit_of_measure: 'kg',
    expiration_date: '2025-06-30',
    weight: 10,
    dimensions: '30x20x15 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'OMRI Listed',
    hazardous_material: false
  },
  181 => {
    name: 'Hybrid Corn Seed',
    description:
      'High-yielding hybrid corn seed for optimal growth and productivity.',
    sku: generate_unique_sku,
    price: 120,
    cost: 100,
    stock_quantity: 5000,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 100,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 25,
    dimensions: '50x30x10 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  182 => {
    name: 'Non-GMO Soybean Seed',
    description: 'High-quality non-GMO soybean seed for sustainable farming.',
    sku: generate_unique_sku,
    price: 150,
    cost: 125,
    stock_quantity: 3000,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 200,
    reorder_level: 400,
    reorder_quantity: 800,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 20,
    dimensions: '45x25x10 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  183 => {
    name: 'Wheat Seed',
    description: 'Premium wheat seed for high-quality grain production.',
    sku: generate_unique_sku,
    price: 100,
    cost: 85,
    stock_quantity: 4000,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 150,
    reorder_level: 600,
    reorder_quantity: 1200,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 30,
    dimensions: '55x35x15 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  184 => {
    name: 'Barley Seed',
    description: 'Superior barley seed for excellent yield and quality.',
    sku: generate_unique_sku,
    price: 110,
    cost: 90,
    stock_quantity: 3500,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 200,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 22,
    dimensions: '48x28x12 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  185 => {
    name: 'Oat Seed',
    description: 'Top-quality oat seed for nutritious and robust crop.',
    sku: generate_unique_sku,
    price: 95,
    cost: 80,
    stock_quantity: 2500,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 100,
    reorder_level: 400,
    reorder_quantity: 800,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 18,
    dimensions: '40x25x10 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  186 => {
    name: 'Alfalfa Seed',
    description: 'High-performance alfalfa seed for nutritious forage.',
    sku: generate_unique_sku,
    price: 130,
    cost: 110,
    stock_quantity: 3200,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 150,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 24,
    dimensions: '50x30x15 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  187 => {
    name: 'Ryegrass Seed',
    description: 'Premium ryegrass seed for lush, durable pastures.',
    sku: generate_unique_sku,
    price: 140,
    cost: 120,
    stock_quantity: 2800,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 150,
    reorder_level: 400,
    reorder_quantity: 800,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 20,
    dimensions: '45x25x12 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  188 => {
    name: 'Sorghum Seed',
    description: 'High-yield sorghum seed for sustainable crop production.',
    sku: generate_unique_sku,
    price: 125,
    cost: 105,
    stock_quantity: 3300,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 200,
    reorder_level: 500,
    reorder_quantity: 1000,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 23,
    dimensions: '48x28x15 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  189 => {
    name: 'Canola Seed',
    description: 'High-quality canola seed for excellent oil production.',
    sku: generate_unique_sku,
    price: 145,
    cost: 125,
    stock_quantity: 2900,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 150,
    reorder_level: 400,
    reorder_quantity: 800,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 22,
    dimensions: '47x27x12 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  190 => {
    name: 'Sunflower Seed',
    description:
      'High-yield sunflower seed for nutritious and high-quality oil production.',
    sku: generate_unique_sku,
    price: 160,
    cost: 140,
    stock_quantity: 3100,
    product_type: 'supplier',
    min_lead_time: 14,
    min_order_quantity: 150,
    reorder_level: 400,
    reorder_quantity: 800,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31T00:00:00Z',
    weight: 21,
    dimensions: '46x26x12 cm',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic, Non-GMO',
    hazardous_material: false
  },
  191 => {
    name: 'Clover Seed',
    description:
      'High-quality clover seed for nutritious and productive forage.',
    sku: generate_unique_sku,
    price: 50,
    cost: 40,
    stock_quantity: 1000,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 50,
    reorder_level: 200,
    reorder_quantity: 500,
    unit_of_measure: 'kg',
    expiration_date: '2025-12-31',
    weight: 1,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  192 => {
    name: 'Timothy Grass Seed',
    description: 'Premium timothy grass seed for high-yield forage.',
    sku: generate_unique_sku,
    price: 45,
    cost: 35,
    stock_quantity: 800,
    product_type: 'supplier',
    min_lead_time: 6,
    min_order_quantity: 40,
    reorder_level: 160,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-11-30',
    weight: 1.2,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Canada',
    certifications: 'Non-GMO',
    hazardous_material: false
  },
  193 => {
    name: 'Orchard Grass Seed',
    description: 'Top-quality orchard grass seed for resilient pastures.',
    sku: generate_unique_sku,
    price: 48,
    cost: 38,
    stock_quantity: 900,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 45,
    reorder_level: 180,
    reorder_quantity: 450,
    unit_of_measure: 'kg',
    expiration_date: '2025-10-31',
    weight: 1.1,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Non-GMO',
    hazardous_material: false
  },
  194 => {
    name: 'Fescue Seed',
    description: 'Durable fescue seed ideal for both pasture and turf.',
    sku: generate_unique_sku,
    price: 42,
    cost: 32,
    stock_quantity: 950,
    product_type: 'supplier',
    min_lead_time: 4,
    min_order_quantity: 50,
    reorder_level: 190,
    reorder_quantity: 475,
    unit_of_measure: 'kg',
    expiration_date: '2025-09-30',
    weight: 1,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  195 => {
    name: 'Bermuda Grass Seed',
    description: 'High-performance bermuda grass seed for warm climates.',
    sku: generate_unique_sku,
    price: 55,
    cost: 45,
    stock_quantity: 700,
    product_type: 'supplier',
    min_lead_time: 6,
    min_order_quantity: 35,
    reorder_level: 140,
    reorder_quantity: 350,
    unit_of_measure: 'kg',
    expiration_date: '2025-08-31',
    weight: 1.3,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Non-GMO',
    hazardous_material: false
  },
  196 => {
    name: 'Bromegrass Seed',
    description: 'Reliable bromegrass seed for high-yield pastures.',
    sku: generate_unique_sku,
    price: 47,
    cost: 37,
    stock_quantity: 850,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 40,
    reorder_level: 170,
    reorder_quantity: 425,
    unit_of_measure: 'kg',
    expiration_date: '2025-07-31',
    weight: 1.1,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  197 => {
    name: 'Sainfoin Seed',
    description: 'Nutritious sainfoin seed for improved forage quality.',
    sku: generate_unique_sku,
    price: 50,
    cost: 40,
    stock_quantity: 600,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 30,
    reorder_level: 120,
    reorder_quantity: 300,
    unit_of_measure: 'kg',
    expiration_date: '2025-06-30',
    weight: 1.2,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Canada',
    certifications: 'Non-GMO',
    hazardous_material: false
  },
  198 => {
    name: 'Sudan Grass Seed',
    description: 'High-yield sudan grass seed for robust forage.',
    sku: generate_unique_sku,
    price: 52,
    cost: 42,
    stock_quantity: 750,
    product_type: 'supplier',
    min_lead_time: 5,
    min_order_quantity: 35,
    reorder_level: 140,
    reorder_quantity: 350,
    unit_of_measure: 'kg',
    expiration_date: '2025-05-31',
    weight: 1.3,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Organic',
    hazardous_material: false
  },
  199 => {
    name: 'Triticale Seed',
    description: 'High-quality triticale seed for nutritious forage.',
    sku: generate_unique_sku,
    price: 48,
    cost: 38,
    stock_quantity: 800,
    product_type: 'supplier',
    min_lead_time: 6,
    min_order_quantity: 40,
    reorder_level: 160,
    reorder_quantity: 400,
    unit_of_measure: 'kg',
    expiration_date: '2025-04-30',
    weight: 1.2,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'Canada',
    certifications: 'Non-GMO',
    hazardous_material: false
  },
  200 => {
    name: 'Teff Grass Seed',
    description: 'Versatile teff grass seed for both hay and pasture.',
    sku: generate_unique_sku,
    price: 49,
    cost: 39,
    stock_quantity: 650,
    product_type: 'supplier',
    min_lead_time: 7,
    min_order_quantity: 30,
    reorder_level: 130,
    reorder_quantity: 325,
    unit_of_measure: 'kg',
    expiration_date: '2025-03-31',
    weight: 1.1,
    dimensions: 'N/A',
    storage_conditions: 'Cool, dry place',
    product_origin: 'USA',
    certifications: 'Non-GMO',
    hazardous_material: false
  }
}

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
    is_supplier: true,
    is_customer: true,
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
    is_supplier: true,
    is_customer: false,
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
    is_supplier: true,
    is_customer: false,
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
    first_name: 'Richard',
    last_name: 'Bennett',
    email: 'info@garbennett.com',
    phone_number: '(559) 638-6311',
    company_name: 'Gar Bennett LLC',
    address_line1: '789 Agriculture Lane',
    address_line2: '',
    city: 'Reedley',
    state: 'CA',
    postal_code: '93654',
    country: 'USA',
    is_supplier: true,
    is_customer: true,
    productKeys: %w[
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
    first_name: 'John',
    last_name: 'Alexander',
    email: 'john.alexander@bucra.com',
    phone_number: '530-555-1234',
    company_name: 'Butte County Rice Growers Association (BUCRA)',
    address_line1: '123 Rice St',
    address_line2: '',
    city: 'Richvale',
    state: 'CA',
    postal_code: '95974',
    country: 'USA',
    is_supplier: true,
    is_customer: false,
    productKeys: ['111']
  },
  {
    first_name: 'Emily',
    last_name: 'Williams',
    email: 'emilywilliams@organicfertilizers.com',
    phone_number: '559-584-6797',
    company_name: 'California Organic Fertilizers, Inc.',
    address_line1: '10585 Industry Ave',
    address_line2: '',
    city: 'Hanford',
    state: 'CA',
    postal_code: '93230',
    country: 'USA',
    is_supplier: true,
    is_customer: false,
    productKeys: %w[
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
      172
      173
      174
      175
      176
      177
      178
      179
      180
    ]
  },
  {
    first_name: 'Mark',
    last_name: 'Wong',
    email: 'mark.wong@swseedco.com',
    phone_number: '916-446-6000',
    company_name: 'S&W Seed Co.',
    address_line1: '106 K Street',
    address_line2: '',
    city: 'Sacramento',
    state: 'CA',
    postal_code: '95814',
    country: 'USA',
    is_supplier: true,
    is_customer: false,
    productKeys: %w[
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
    first_name: 'Landon',
    last_name: 'Trevino',
    email: 'landon.trevino@chsinc.com',
    phone_number: '651-987-6543',
    company_name: 'CHS Inc.',
    address_line1: '456 Cooperative Way',
    address_line2: '',
    city: 'Inver Grove Heights',
    state: 'MN',
    postal_code: '55077',
    country: 'USA',
    is_supplier: true,
    is_customer: true,
    productKeys: %w[
      101
      102
      103
      104
      105
      106
      107
      108
      109
      110
      111
      112
      113
      114
      115
      116
      117
      118
    ]
  },
  {
    first_name: 'Wesley',
    last_name: 'Harper',
    email: 'wesley.harper@growmark.com',
    phone_number: '309-456-7890',
    company_name: 'GROWMARK, Inc.',
    address_line1: '101 Agronomy St',
    address_line2: '',
    city: 'Bloomington',
    state: 'IL',
    postal_code: '61701',
    country: 'USA',
    is_supplier: true,
    is_customer: true,
    productKeys: %w[
      104
      105
      106
      107
      112
      113
      114
      117
      118
    ]
  },
  {
    first_name: 'Nina',
    last_name: 'Sharp',
    email: 'nina.sharp@cargill.com',
    phone_number: '952-555-1122',
    company_name: 'Cargill',
    address_line1: '1122 Agronomy Way',
    address_line2: '',
    city: 'Wayzata',
    state: 'MN',
    postal_code: '55391',
    country: 'USA',
    is_supplier: true,
    is_customer: false,
    productKeys: %w[
      101
      102
      103
      104
      105
      106
      107
      108
      109
      110
      112
      113
      114
      115
      116
      117
      118
    ]
  },
  {
    first_name: 'Walter',
    last_name: 'Bishop',
    email: 'walter.bishop@adm.com',
    phone_number: '312-555-3344',
    company_name: 'ADM',
    address_line1: '3344 Processing Avenue',
    address_line2: '',
    city: 'Chicago',
    state: 'IL',
    postal_code: '60601',
    country: 'USA',
    is_supplier: true,
    is_customer: false,
    productKeys: %w[
      101
      102
      103
      104
      105
      106
      107
      108
      109
      110
      111
      112
      113
      114
      115
      116
      117
      118
    ]
  },
  {
    first_name: 'Oliver',
    last_name: 'Thatcher',
    email: 'oliver.thatcher@bayercropscience.com',
    phone_number: '919-555-0101',
    company_name: 'Bayer CropScience',
    address_line1: '2 TW Alexander Dr',
    address_line2: '',
    city: 'Research Triangle Park',
    state: 'NC',
    postal_code: '27709',
    country: 'USA',
    is_supplier: true,
    is_customer: false,
    productKeys: %w[
      119
      120
      121
      122
      123
      124
      125
      126
      127
      128
      129
      130
      131
      132
      133
      134
      135
      136
      137
      138
    ]
  },
  {
    first_name: 'Camilla',
    last_name: 'Siegfried',
    email: 'camilla.siegfried@syngenta.com',
    phone_number: '+41-61-555-0202',
    company_name: 'Syngenta',
    address_line1: 'Rosentalstrasse 67',
    address_line2: '',
    city: 'Basel',
    state: '',
    postal_code: '4002',
    country: 'Switzerland',
    is_supplier: true,
    is_customer: false,
    productKeys: %w[
      108
      109
      110
      119
      120
      121
      122
      123
      124
      125
      126
      127
      128
      129
      130
      131
      132
      133
      134
      135
      136
      137
      138
    ]
  },
  {
    first_name: 'Harrison',
    last_name: 'Keating',
    email: 'harrison.keating@dfamilk.com',
    phone_number: '816-555-0303',
    company_name: 'Dairy Farmers of America',
    address_line1: '1405 N 98th St',
    address_line2: '',
    city: 'Kansas City',
    state: 'MO',
    postal_code: '64155',
    country: 'USA',
    is_supplier: true,
    is_customer: true,
    productKeys: %w[101 102 103 115 116]
  },
  {
    first_name: 'Eleanor',
    last_name: 'Winslow',
    email: 'eleanor.winslow@landolakes.com',
    phone_number: '651-555-0404',
    company_name: 'Land O’Lakes',
    address_line1: '4001 Lexington Ave N',
    address_line2: '',
    city: 'Arden Hills',
    state: 'MN',
    postal_code: '55126',
    country: 'USA',
    is_supplier: true,
    is_customer: true,
    productKeys: %w[
      119
      120
      121
      122
      123
      124
      125
      126
      127
      128
      129
      130
      131
      132
      133
      134
      135
      136
      137
      138
    ]
  }
]

supplier_products_map = {}

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
    is_supplier: company_data[:is_supplier],
    is_customer: company_data[:is_customer],
    is_internal: false
  )

  company_data[:productKeys].each do |product_key|
    product_data = all_supplier_products[product_key.to_i]
    product = company.products.create!(
      name: product_data[:name],
      description: product_data[:description],
      sku: generate_unique_sku,
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
    supplier_products_map[product_key.to_i] = product
  end
end

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
        sku: generate_unique_sku,
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
        sku: generate_unique_sku,
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
        sku: generate_unique_sku,
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
      },
      {
        name: 'Hog Grower Feed',
        description: 'Balanced feed for growing hogs to ensure healthy weight gain.',
        sku: generate_unique_sku,
        company_id: 1,
        price: 22.0,
        cost: 14.0,
        stock_quantity: 700,
        sales_count: 180,
        product_type: 'wm_product',
        last_sale_date: '2024-06-14T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 300, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 150, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 120, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 124, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' },
          { supplier_product_key: 126, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Calf Starter Feed',
        description: 'High-protein starter feed for calves to support early development and growth.',
        sku: generate_unique_sku,
        company_id: 1,
        price: 24.0,
        cost: 16.0,
        stock_quantity: 600,
        sales_count: 220,
        product_type: 'wm_product',
        last_sale_date: '2024-06-13T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 500, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 300, unit_of_measure: 'kg' },
          { supplier_product_key: 110, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 131, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 136, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 138, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 155, weight_needed_per_batch: 20, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Beef Cattle Feed',
        description: 'Nutritious feed for beef cattle to promote healthy weight gain and muscle development.',
        sku: generate_unique_sku,
        company_id: 1,
        price: 26.0,
        cost: 17.0,
        stock_quantity: 900,
        sales_count: 250,
        product_type: 'wm_product',
        last_sale_date: '2024-06-11T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 102, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 70, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 108, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 111, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 113, weight_needed_per_batch: 5, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Pelleted Sheep Feed',
        description: 'Complete pelleted feed for sheep to ensure balanced nutrition and health.',
        sku: generate_unique_sku,
        company_id: 1,
        price: 19.5,
        cost: 11.5,
        stock_quantity: 400,
        sales_count: 100,
        product_type: 'wm_product',
        last_sale_date: '2024-06-16T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 300, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 106, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 109, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 110, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 113, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 120, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 121, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 122, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 124, weight_needed_per_batch: 1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Goat Feed',
        description: 'Balanced feed for goats to support overall health and milk production.',
        sku: generate_unique_sku,
        company_id: 1,
        price: 21.0,
        cost: 13.0,
        stock_quantity: 350,
        sales_count: 90,
        product_type: 'wm_product',
        last_sale_date: '2024-06-17T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 102, weight_needed_per_batch: 150, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 120, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 116, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 117, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 118, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 119, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 120, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 121, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 122, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 123, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 124, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 125, weight_needed_per_batch: 1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Horse Feed',
        description: 'High-fiber feed for horses to ensure energy, health, and performance.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 1,
        price: 23.0,
        cost: 15.0,
        stock_quantity: 750,
        sales_count: 140,
        product_type: 'wm_product',
        last_sale_date: '2024-06-18T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 300, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 150, unit_of_measure: 'kg' },
          { supplier_product_key: 113, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 118, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 119, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 121, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 130, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 137, weight_needed_per_batch: 3, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Rabbit Feed',
        description: 'Nutrient-dense feed for rabbits to support growth, health, and reproduction.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 1,
        price: 17.0,
        cost: 10.0,
        stock_quantity: 300,
        sales_count: 110,
        product_type: 'wm_product',
        last_sale_date: '2024-06-19T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 4, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 106, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 158, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 137, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' },
          { supplier_product_key: 140, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
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
        sku: generate_unique_sku,
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
        sku: generate_unique_sku,
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
        sku: generate_unique_sku,
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
      },
      {
        name: 'Organic Layer Feed',
        description: 'Certified organic feed for layer hens to ensure high-quality egg production.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 22.5,
        cost: 14.0,
        stock_quantity: 500,
        sales_count: 160,
        product_type: 'wm_product',
        last_sale_date: '2024-06-13T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 103, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 101, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 106, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 136, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' },
          { supplier_product_key: 137, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' },
          { supplier_product_key: 138, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'All-Purpose Goat Feed',
        description: 'Balanced feed for goats to support health and milk production.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 20.0,
        cost: 12.5,
        stock_quantity: 350,
        sales_count: 90,
        product_type: 'wm_product',
        last_sale_date: '2024-06-14T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 25, unit_of_measure: 'kg' },
          { supplier_product_key: 102, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 110, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 113, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 125, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' },
          { supplier_product_key: 135, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Sheep Pellets',
        description: 'Nutritious pelleted feed for sheep to ensure balanced growth and health.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 18.0,
        cost: 10.5,
        stock_quantity: 450,
        sales_count: 110,
        product_type: 'wm_product',
        last_sale_date: '2024-06-15T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 150, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 120, unit_of_measure: 'kg' },
          { supplier_product_key: 159, weight_needed_per_batch: 80, unit_of_measure: 'kg' },
          { supplier_product_key: 130, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 131, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Swine Grower Feed',
        description: 'Complete feed for growing swine to promote healthy weight gain.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 21.0,
        cost: 13.0,
        stock_quantity: 300,
        sales_count: 70,
        product_type: 'wm_product',
        last_sale_date: '2024-06-16T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 500, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 300, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 200, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 100, unit_of_measure: 'kg' },
          { supplier_product_key: 121, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 123, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 130, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 137, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 138, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Alpaca Feed',
        description: 'Specialized feed for alpacas to support overall health and fiber production.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 24.0,
        cost: 15.0,
        stock_quantity: 200,
        sales_count: 60,
        product_type: 'wm_product',
        last_sale_date: '2024-06-17T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 25, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 108, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 117, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 113, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 126, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' },
          { supplier_product_key: 135, weight_needed_per_batch: 0.2, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Dog Maintenance Diet',
        description: 'Balanced diet for adult dogs to maintain optimal health and energy.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 30.0,
        cost: 20.0,
        stock_quantity: 750,
        sales_count: 250,
        product_type: 'wm_product',
        last_sale_date: '2024-06-18T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 8, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 7, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 12, unit_of_measure: 'kg' },
          { supplier_product_key: 114, weight_needed_per_batch: 6, unit_of_measure: 'kg' },
          { supplier_product_key: 110, weight_needed_per_batch: 4, unit_of_measure: 'kg' },
          { supplier_product_key: 125, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' },
          { supplier_product_key: 124, weight_needed_per_batch: 0.3, unit_of_measure: 'kg' },
          { supplier_product_key: 131, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' },
          { supplier_product_key: 135, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' },
          { supplier_product_key: 138, weight_needed_per_batch: 0.1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Cat Premium Diet',
        description: 'Premium diet for cats to ensure health and vitality.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 28.0,
        cost: 18.0,
        stock_quantity: 500,
        sales_count: 200,
        product_type: 'wm_product',
        last_sale_date: '2024-06-19T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 103, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 106, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 110, weight_needed_per_batch: 8, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 4, unit_of_measure: 'kg' },
          { supplier_product_key: 125, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Parrot Maintenance Feed',
        description: 'Nutritionally complete feed for parrots to maintain their health.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 26.0,
        cost: 16.0,
        stock_quantity: 300,
        sales_count: 90,
        product_type: 'wm_product',
        last_sale_date: '2024-06-20T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 108, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 109, weight_needed_per_batch: 1, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Hamster Food',
        description: 'Balanced feed for hamsters to support their health and activity.',
        sku: generate_unique_sku,
        category_id: 1,
        company_id: 2,
        price: 15.0,
        cost: 9.0,
        stock_quantity: 400,
        sales_count: 130,
        product_type: 'wm_product',
        last_sale_date: '2024-06-21T00:00:00Z',
        category: 'Feed',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 4, unit_of_measure: 'kg' },
          { supplier_product_key: 108, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 109, weight_needed_per_batch: 1.5, unit_of_measure: 'kg' },
          { supplier_product_key: 112, weight_needed_per_batch: 0.5, unit_of_measure: 'kg' }
        ]
      }
    ]
  },
  {
    first_name: 'Mike',
    last_name: 'Burgess',
    email: 'mike.burgess@westernmilling.com',
    phone_number: '555-345-6789',
    company_name: 'Western Milling Fertilizer Operations',
    address_line1: '789 Fertilizer Blvd',
    address_line2: '',
    city: 'Famoso',
    state: 'CA',
    postal_code: '93268',
    country: 'USA',
    is_supplier: false,
    is_customer: false,
    is_internal: true,
    products: [
      {
        name: 'Nitrogen Fertilizer',
        description: 'High-efficiency nitrogen fertilizer to promote robust plant growth.',
        sku: generate_unique_sku,
        category_id: 2,
        company_id: 3,
        price: 45.0,
        cost: 30.0,
        stock_quantity: 1000,
        sales_count: 200,
        product_type: 'wm_product',
        last_sale_date: '2024-06-15T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 161, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 162, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 163, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 164, weight_needed_per_batch: 12, unit_of_measure: 'kg' },
          { supplier_product_key: 168, weight_needed_per_batch: 8, unit_of_measure: 'kg' },
          { supplier_product_key: 169, weight_needed_per_batch: 5, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Phosphorus Fertilizer',
        description: 'Essential phosphorus fertilizer to support root development and flowering.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 50.0,
        cost: 35.0,
        stock_quantity: 800,
        sales_count: 150,
        product_type: 'wm_product',
        last_sale_date: '2024-06-12T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 164, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 165, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 170, weight_needed_per_batch: 10, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Potassium Fertilizer',
        description: 'Potassium-rich fertilizer to enhance plant vigor and disease resistance.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 48.0,
        cost: 32.0,
        stock_quantity: 900,
        sales_count: 180,
        product_type: 'wm_product',
        last_sale_date: '2024-06-13T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 166, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 167, weight_needed_per_batch: 5, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Calcium Nitrate',
        description: 'Calcium nitrate fertilizer to improve cell wall strength and quality of crops.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 55.0,
        cost: 37.0,
        stock_quantity: 700,
        sales_count: 160,
        product_type: 'wm_product',
        last_sale_date: '2024-06-14T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 168, weight_needed_per_batch: 45, unit_of_measure: 'kg' },
          { supplier_product_key: 163, weight_needed_per_batch: 10, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Magnesium Sulfate',
        description: 'Magnesium sulfate to aid in photosynthesis and plant nutrient absorption.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 40.0,
        cost: 28.0,
        stock_quantity: 600,
        sales_count: 140,
        product_type: 'wm_product',
        last_sale_date: '2024-06-16T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 169, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 161, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 162, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 166, weight_needed_per_batch: 25, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Sulfur Fertilizer',
        description: 'Sulfur fertilizer to enhance enzyme activity and protein synthesis in plants.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 35.0,
        cost: 25.0,
        stock_quantity: 800,
        sales_count: 130,
        product_type: 'wm_product',
        last_sale_date: '2024-06-17T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 163, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 169, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 167, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 168, weight_needed_per_batch: 5, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Zinc Chelate',
        description: 'Zinc chelate to prevent zinc deficiency and promote healthy growth.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 42.0,
        cost: 29.0,
        stock_quantity: 500,
        sales_count: 120,
        product_type: 'wm_product',
        last_sale_date: '2024-06-18T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 125, weight_needed_per_batch: 10, unit_of_measure: 'kg' },
          { supplier_product_key: 126, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 128, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Boron Fertilizer',
        description: 'Boron fertilizer to improve cell wall formation and reproductive development.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 38.0,
        cost: 26.0,
        stock_quantity: 400,
        sales_count: 100,
        product_type: 'wm_product',
        last_sale_date: '2024-06-19T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 152, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 160, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 173, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Iron Chelate',
        description: 'Iron chelate to prevent iron chlorosis and ensure healthy green leaves.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 47.0,
        cost: 33.0,
        stock_quantity: 300,
        sales_count: 110,
        product_type: 'wm_product',
        last_sale_date: '2024-06-20T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 123, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 124, weight_needed_per_batch: 7, unit_of_measure: 'kg' },
          { supplier_product_key: 125, weight_needed_per_batch: 6, unit_of_measure: 'kg' },
          { supplier_product_key: 126, weight_needed_per_batch: 4, unit_of_measure: 'kg' },
          { supplier_product_key: 128, weight_needed_per_batch: 3, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Manganese Sulfate',
        description: 'Manganese sulfate to aid in photosynthesis and nitrogen assimilation.',
        sku: generate_unique_sku,
        company_id: 3,
        price: 36.0,
        cost: 24.0,
        stock_quantity: 350,
        sales_count: 90,
        product_type: 'wm_product',
        last_sale_date: '2024-06-21T00:00:00Z',
        category: 'Fertilizers and Soil Amendments',
        ingredients: [
          { supplier_product_key: 126, weight_needed_per_batch: 5, unit_of_measure: 'kg' },
          { supplier_product_key: 163, weight_needed_per_batch: 3, unit_of_measure: 'kg' },
          { supplier_product_key: 168, weight_needed_per_batch: 2, unit_of_measure: 'kg' },
          { supplier_product_key: 170, weight_needed_per_batch: 2, unit_of_measure: 'kg' }
        ]
      }
    ]
  },
  {
    first_name: 'Emily',
    last_name: 'Banister',
    email: 'emily.banister@westernmilling.com',
    phone_number: '555-456-7890',
    company_name: 'Western Milling Grain Merchandising',
    address_line1: '101 Grain Rd',
    address_line2: '',
    city: 'Hereford',
    state: 'TX',
    postal_code: '79045',
    country: 'USA',
    is_supplier: false,
    is_customer: false,
    is_internal: true,
    products: [
      {
        name: 'Corn',
        description: 'High-quality corn for various uses, including animal feed and food production.',
        sku: generate_unique_sku,
        company_id: 4,
        price: 6.0,
        cost: 4.0,
        stock_quantity: 5000,
        sales_count: 2000,
        product_type: 'wm_product',
        last_sale_date: '2024-06-10T00:00:00Z',
        category: 'Grains',
        ingredients: [
          { supplier_product_key: 101, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 102, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 103, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 104, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 115, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 116, weight_needed_per_batch: 30, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Soybeans',
        description: 'Premium soybeans suitable for animal feed and oil production.',
        sku: generate_unique_sku,
        company_id: 4,
        price: 8.0,
        cost: 5.0,
        stock_quantity: 4000,
        sales_count: 1500,
        product_type: 'wm_product',
        last_sale_date: '2024-06-11T00:00:00Z',
        category: 'Grains',
        ingredients: [
          { supplier_product_key: 103, weight_needed_per_batch: 50, unit_of_measure: 'kg' },
          { supplier_product_key: 120, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 121, weight_needed_per_batch: 1, unit_of_measure: 'kg' },
          { supplier_product_key: 122, weight_needed_per_batch: 1.5, unit_of_measure: 'kg' },
          { supplier_product_key: 130, weight_needed_per_batch: 25, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Wheat',
        description: 'Top-grade wheat for baking, animal feed, and other food products.',
        sku: generate_unique_sku,
        company_id: 4,
        price: 7.0,
        cost: 4.5,
        stock_quantity: 6000,
        sales_count: 2500,
        product_type: 'wm_product',
        last_sale_date: '2024-06-12T00:00:00Z',
        category: 'Grains',
        ingredients: [
          { supplier_product_key: 104, weight_needed_per_batch: 500, unit_of_measure: 'kg' },
          { supplier_product_key: 102, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 101, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 108, weight_needed_per_batch: 10, unit_of_measure: 'kg' }
        ]
      },
      {
        name: 'Barley',
        description: 'High-quality barley for brewing, animal feed, and food production.',
        sku: generate_unique_sku,
        company_id: 4,
        price: 5.5,
        cost: 3.5,
        stock_quantity: 3500,
        sales_count: 1800,
        product_type: 'wm_product',
        last_sale_date: '2024-06-13T00:00:00Z',
        category: 'Grains',
        ingredients: [
          { supplier_product_key: 104, weight_needed_per_batch: 20, unit_of_measure: 'kg' },
          { supplier_product_key: 105, weight_needed_per_batch: 30, unit_of_measure: 'kg' },
          { supplier_product_key: 107, weight_needed_per_batch: 15, unit_of_measure: 'kg' },
          { supplier_product_key: 117, weight_needed_per_batch: 10, unit_of_measure: 'kg' }
        ]
      }
    ]
  }
]

# Method to generate random dates within the past and future 3 months
def random_date_within_3_months
  start_date = 3.months.ago.to_date
  end_date = 3.months.from_now.to_date
  rand(start_date..end_date)
end

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
    is_supplier: company_data[:is_supplier],
    is_customer: company_data[:is_customer],
    is_internal: company_data[:is_internal]
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
      supplier_product = supplier_products_map[ingredient_data[:supplier_product_key]]
      if supplier_product
        product.ingredients.create!(
          supplier_product_id: supplier_product.id,
          weight_needed_per_batch: ingredient_data[:weight_needed_per_batch],
          unit_of_measure: ingredient_data[:unit_of_measure]
        )
      else
        puts "Warning: Supplier product with key #{ingredient_data[:supplier_product_key]} not found."
      end
    end

    # Creating purchase orders for the company
    20.times do
      purchase_order = PurchaseOrder.create!(
        company: company,
        order_number: Faker::Number.unique.number(digits: 10),
        order_date: random_date_within_3_months,
        delivery_date: random_date_within_3_months,
        total_amount: Faker::Commerce.price(range: 1000..10_000),
        status: %w[Pending Shipped Delivered Cancelled].sample
      )

      # Associate random products with the purchase order
      rand(1..5).times do
        product = Product.order('RANDOM()').first # Select a random product
        purchase_order.products << product
      end
    end
  end
end

puts 'Seeding completed successfully!'
puts "PurchaseOrder count after seeding: #{PurchaseOrder.count}"
