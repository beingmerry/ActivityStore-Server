# frozen_string_literal: true

# t.string :activity_name
# t.string :item_first
# t.string :item_second
# t.string :item_third

# ActiveRecord::Base model for Activity
class Activity < ActiveRecord::Base
  # Attempting to link this to the user via has-one relationship so that each user has a activities table
  # ⛔ NOT WORKING AT ALL, 2022-01-04, 20:37, BJM ⛔ #
  has_and_belongs_to_many :users
end
