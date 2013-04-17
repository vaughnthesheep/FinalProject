class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders
  has_many :cart_items
end
