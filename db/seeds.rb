# <----- 🗑️ DESTROY tables -----> #
def destroy_tables
  puts '🗑️  Dropping existing tables...Items, Purchases, Stores, Activities, Users'
  Item.destroy_all
  Purchase.destroy_all
  Store.destroy_all
  Activity.destroy_all
  User.destroy_all
end
# <----- ⏱️ Resetting SEQUENCE -----> #
def reset_id_sequence
  puts '⏱️  Resetting ALL table ID sequences to 0'
  ActiveRecord::Base.connection.execute(
    'DELETE from sqlite_sequence WHERE seq > 0'
  )
end
# <----- 🌱 Seeding Items -----> #
def seed_items
  puts '🌱 Seeding items...'
  Item.create(
    item_name: 'Athletic Shorts',
    item_image_url:
      'https://m.media-amazon.com/images/I/81r8m9RvLrL._AC_UX679_.jpg'
  )
  Item.create(
    item_name: 'Backpack',
    item_image_url:
      'https://m.media-amazon.com/images/I/81nlnnOKiLL._AC_SL1500_.jpg'
  )
  Item.create(
    item_name: 'Basketball',
    item_image_url:
      'https://m.media-amazon.com/images/I/71XAg43zAEL._AC_SL1000_.jpg'
  )
  Item.create(
    item_name: 'Basketball shoes',
    item_image_url:
      'https://m.media-amazon.com/images/I/51k2zH5U6TL._AC_UX500_.jpg'
  )
  Item.create(
    item_name: 'Bike',
    item_image_url:
      'https://m.media-amazon.com/images/I/81wOQ1MaQ0L._AC_SL1500_.jpg'
  )
  Item.create(
    item_name: 'Bike Helmet',
    item_image_url:
      'https://m.media-amazon.com/images/I/51JQM0U7l0L._AC_SL1001_.jpg'
  )
  Item.create(
    item_name: 'Cleats',
    item_image_url:
      'https://m.media-amazon.com/images/I/71WEVjm3aWL._AC_UX500_.jpg'
  )
  Item.create(
    item_name: 'Frisbee',
    item_image_url: 'https://m.media-amazon.com/images/I/6106gCy09ZL._AC_.jpg'
  )
  Item.create(
    item_name: 'Gloves',
    item_image_url:
      'https://m.media-amazon.com/images/I/81j0ckFZcEL._AC_UX679_.jpg'
  )
  Item.create(
    item_name: 'Hat',
    item_image_url:
      'https://m.media-amazon.com/images/I/71tdDkcj-7L._AC_UX679_.jpg'
  )
  Item.create(
    item_name: 'Hiking Boots',
    item_image_url:
      'https://m.media-amazon.com/images/I/81b6sZ+xAuL._AC_SX395_SY395_.jpg'
  )
  Item.create(
    item_name: 'Jacket',
    item_image_url:
      'https://m.media-amazon.com/images/I/51hC6aVni4L._AC_UX679_.jpg'
  )
  Item.create(
    item_name: 'Running Shoes',
    item_image_url:
      'https://m.media-amazon.com/images/I/610DKH06nTL._AC_UY500_.jpg'
  )
  Item.create(
    item_name: 'Snowboard',
    item_image_url:
      'https://m.media-amazon.com/images/I/71IJSP7S8WL.__AC_SX300_SY300_QL70_FMwebp_.jpg'
  )
  Item.create(
    item_name: 'Snowboard Helmet',
    item_image_url:
      'https://m.media-amazon.com/images/I/51JQM0U7l0L._AC_SL1001_.jpg'
  )
  Item.create(
    item_name: 'Socks',
    item_image_url:
      'https://m.media-amazon.com/images/I/81VdUJHmd0L._AC_UX679_.jpg'
  )
  Item.create(
    item_name: 'Sunglasses',
    item_image_url:
      'https://m.media-amazon.com/images/I/51kecFB7DHL._AC_UX679_.jpg'
  )
  Item.create(
    item_name: 'Tent',
    item_image_url:
      'https://m.media-amazon.com/images/I/71HmL4kzLrL._AC_SL1500_.jpg'
  )
  Item.create(
    item_name: 'Water Bottle',
    item_image_url:
      'https://m.media-amazon.com/images/I/61PgN9R+7kS._AC_SY300_SX300_.jpg'
  )
end
# <----- 🏪 Seeding Stores -----> #
def seed_stores
  puts '🏪 Store seeding...'
  Store.create(
    store_name: 'Wal-Mart',
    address: '123 Main Street',
    item_1: Item.all.sample.item_name,
    item_2: Item.all.sample.item_name,
    item_3: Item.all.sample.item_name,
    item_4: Item.all.sample.item_name,
    item_1_cost: rand(10..100),
    item_2_cost: rand(10..100),
    item_3_cost: rand(10..100),
    item_4_cost: rand(10..100)
  )
  Store.create(
    store_name: 'Schills',
    address: '1 South Ave',
    item_1: Item.all.sample.item_name,
    item_2: Item.all.sample.item_name,
    item_3: Item.all.sample.item_name,
    item_4: Item.all.sample.item_name,
    item_1_cost: rand(10..100),
    item_2_cost: rand(10..100),
    item_3_cost: rand(10..100),
    item_4_cost: rand(10..100)
  )
  Store.create(
    store_name: 'Target',
    address: '42 Answer Way',
    item_1: Item.all.sample.item_name,
    item_2: Item.all.sample.item_name,
    item_3: Item.all.sample.item_name,
    item_4: Item.all.sample.item_name,
    item_1_cost: rand(10..100),
    item_2_cost: rand(10..100),
    item_3_cost: rand(10..100),
    item_4_cost: rand(10..100)
  )
end
# <----- 🏃 Seeding Activities -----> #
def seed_activities
  puts '🏃 Activity seeding...'
  Activity.create(
    activity_name: 'Hiking',
    activity_image_url:
      'https://upload.wikimedia.org/wikipedia/commons/a/a9/Hiking_to_the_Ice_Lakes._San_Juan_National_Forest%2C_Colorado.jpg',
    item_first: 'Hiking Boots',
    item_second: 'Sunglasses',
    item_third: 'Water Bottle'
  )
  Activity.create(
    activity_name: 'Biking',
    activity_image_url:
      'https://upload.wikimedia.org/wikipedia/commons/9/94/Leon_Georget_1909.jpg',
    item_first: 'Bike',
    item_second: 'Sunglasses',
    item_third: 'Bike Helmet'
  )
  Activity.create(
    activity_name: 'Running',
    activity_image_url:
      'https://upload.wikimedia.org/wikipedia/commons/4/48/How_to_achieve_your_weight_loss_goals.jpg',
    item_first: 'Running Shoes',
    item_second: 'Socks',
    item_third: 'Athletic Shorts'
  )
  Activity.create(
    activity_name: 'Snowboarding',
    activity_image_url:
      'https://store-guides2.djicdn.com/guides/wp-content/uploads/2020/02/Osmo-Action-Snowboarding-1-1260x840.jpg',
    item_first: 'Snowboard',
    item_second: 'Jacket',
    item_third: 'Snowboard Helmet'
  )
  Activity.create(
    activity_name: 'Lifting Weights',
    activity_image_url:
      'https://upload.wikimedia.org/wikipedia/commons/5/59/Crossfit_gym_cz.jpg',
    item_first: 'Athletic Shorts',
    item_second: 'Gloves',
    item_third: 'Water Bottle'
  )
  Activity.create(
    activity_name: 'Mountain Climbing',
    activity_image_url:
      'https://upload.wikimedia.org/wikipedia/commons/3/38/M_Rainier.jpg',
    item_first: 'Hiking Boots',
    item_second: 'Tent',
    item_third: 'Backpack'
  )
  Activity.create(
    activity_name: 'Basketball',
    activity_image_url:
      'https://upload.wikimedia.org/wikipedia/commons/9/96/Basketball_World_Cup_2014.jpg',
    item_first: 'Basketball',
    item_second: 'Basketball shoes',
    item_third: nil
  )
  Activity.create(
    activity_name: 'Ultimate Frisbee',
    activity_image_url:
      'https://upload.wikimedia.org/wikipedia/commons/d/d0/Rooke_bid.jpg',
    item_first: 'Frisbee',
    item_second: 'Cleats',
    item_third: nil
  )
end
# <----- 👤 Creating Users -----> #
def create_users
  puts '👤 User Creation...'
  User.create(
    name: 'Ben',
    password: 'password',
    favorite_activity: Activity.fourth.activity_name
  )
  User.create(
    name: 'Noah',
    password: 'password',
    favorite_activity: Activity.second.activity_name
  )
  User.create(
    name: 'Jamie',
    password: 'password',
    favorite_activity: Activity.third.activity_name
  )
end
# <----- 💲 Creating Purchases -----> #
def attach_activities_to_user
  puts '🚀 Giving users activities...'
  User.first.activities << Activity.fourth
  User.first.activities << Activity.last
  User.second.activities << Activity.fourth
  User.second.activities << Activity.second
  User.second.activities << Activity.fifth
  User.third.activities << Activity.fourth
  User.third.activities << Activity.second
end
# <----- 💲 Creating Purchases -----> #
def seed_purchases
  puts '💲 Making purchases...'
  10.times do
    Purchase.create(
      item_name: Item.all.sample.item_name,
      review: 'GREAT!',
      star_rating: rand(1..5),
      cost: rand(10.0..100.0),
      user_id: User.all.sample.id,
      store_id: Store.all.sample.id
    )
  end
end
# <----- ⌚ Seeding Sequence -----> #
destroy_tables
reset_id_sequence
seed_items
seed_stores
seed_activities
create_users
attach_activities_to_user
seed_purchases
puts '✅ Done seeding!'
