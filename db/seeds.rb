# users =[
#     {
#         email: 'seller@hotmail.com',
#         password: '123456',
#         password_confirmation: '123456'
#     },
#     {
#         email: 'buyer@hotmail.com',
#         password: '123456',
#         password_confirmation: '123456'
#     },
#     {
#         email: 'seller1@hotmail.com',
#         password: '123456',
#         password_confirmation: '123456'
#     }    
# ]

# # 21 Shalimar Crescent, Dandenong North 3175 VIC
# # 21 Fairbank Road, Clayton South 3169 VIC 
# profiles = [
#     {
#     fullname_company: 'Seller Langford',
#     user_id: 1
# },
# {
#     fullname_company: 'Seller King',
#     user_id: 3
# }
# ]

# addresses = [
#     {
#     user_id: 1,
#     street_address: '57 Langford Street',
#     city: 'Moe',
#     postcode: '3825',
#     state: 'Victoria',
#     country_code: 'AU',
#     address_type: 1
# },
# {
#     user_id: 3,
#     street_address: '15 King St',
#     city: 'Moe',
#     postcode: '3825',
#     state: 'Victoria',
#     country_code: 'AU',
#     address_type: 1
# }
# ]

# User.create!(users)
# Profile.create!(profiles)
# Address.create!(addresses)




u = ImageUploader.new(:store)
path = 'app/assets/images/apples_g.jpeg'
file = File.new(Rails.root.join(path))
uf_apples_g = u.upload(file)

u = ImageUploader.new(:store)
path = 'app/assets/images/apples_r.jpeg'
file = File.new(Rails.root.join(path))
uf_apples_r = u.upload(file)


u = ImageUploader.new(:store)
path = 'app/assets/images/peppers_g.jpeg'
file = File.new(Rails.root.join(path))
uf_peppers_g = u.upload(file)

u = ImageUploader.new(:store)
path = 'app/assets/images/peppers_r.jpeg'
file = File.new(Rails.root.join(path))
uf_peppers_r = u.upload(file)

u = ImageUploader.new(:store)
path = 'app/assets/images/peppers_y.jpeg'
file = File.new(Rails.root.join(path))
uf_peppers_y = u.upload(file)

u = ImageUploader.new(:store)
path = 'app/assets/images/tomatos_dry.jpeg'
file = File.new(Rails.root.join(path))
uf_tomatos_dry = u.upload(file)

u = ImageUploader.new(:store)
path = 'app/assets/images/tomatos_m.jpeg'
file = File.new(Rails.root.join(path))
uf_tomatos_m = u.upload(file)

u = ImageUploader.new(:store)
path = 'app/assets/images/tomatos_s.jpeg'
file = File.new(Rails.root.join(path))
uf_tomatos_s = u.upload(file)


products = [
    {
    user_id: 3,
    product_type: 'Apples',
    description: 'green apples',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_apples_g.to_json,
    product_type_id: 1
},
{
    user_id: 1,
    product_type: 'Apples',
    description: 'red apples',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_apples_r.to_json,
    product_type_id: 1
},
{
    user_id: 1,
    product_type: 'Peppers',
    description: 'green',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_peppers_g.to_json,
    product_type_id: 1
},
{
    user_id: 1,
    product_type: 'Peppers',
    description: 'red',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_peppers_r.to_json,
    product_type_id: 1
},
{
    user_id: 1,
    product_type: 'Peppers',
    description: 'yellow',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_peppers_y.to_json,
    product_type_id: 1
},
{
    user_id: 1,
    product_type: 'Tomatoes',
    description: 'dry',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_tomatos_dry.to_json,
    product_type_id: 1
},
{
    user_id: 1,
    product_type: 'Tomatoes',
    description: 'medium',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_tomatos_m.to_json,
    product_type_id: 1
},
{
    user_id: 3,
    product_type: 'Tomatoes',
    description: 'cheries',
    unit_weight: 1,
    unit: 'kg',
    unit_price: 300,
    qty_stock: 20,
    qty_available: 14,
    image_data: uf_tomatos_s.to_json,
    product_type_id: 1
}
]

Product.create!(products) {|p| puts "created: #{p.product_type}"}
