class Customer < ActiveRecord::Base
  belongs_to :province
  has_many :orders
  has_many :cart_items
  validates_presence_of :first_name, :province_id, :last_name, :city, :address, :postal_code, :phone, :email, :password
end
