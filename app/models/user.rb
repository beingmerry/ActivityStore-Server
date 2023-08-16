# frozen_string_literal: true

# t.string :user_name
# t.string :password

# ActiveRecord::Base model for User
class User < ActiveRecord::Base
  has_and_belongs_to_many :activities
  has_many :purchases
  has_many :stores, through: :purchases
end
