class InitialTables < ActiveRecord::Migration[6.1]
  def change
    # top-level tables (one to many)
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :favorite_activity
    end
    create_table :stores do |t|
      t.string :store_name
      t.string :address
      t.string :item_1
      t.float :item_1_cost
      t.string :item_2
      t.float :item_2_cost
      t.string :item_3
      t.float :item_3_cost
      t.string :item_4
      t.float :item_4_cost
    end
    # helper tables (many to one)
    create_table :activities do |t|
      t.string :activity_name
      t.string :activity_image_url
      t.string :item_first
      t.string :item_second
      t.string :item_third
    end
    # interaction tables (many to many link tables)
    create_table :purchases do |t|
      t.string :item_name
      t.string :review
      t.integer :star_rating
      t.float :cost
      t.belongs_to :user, class_name: 'user', foreign_key: 'user_id'
      t.belongs_to :store, class_name: 'store', foreign_key: 'store_id'
    end
  end
end
