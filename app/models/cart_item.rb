class CartItem < ActiveRecord::Base
  belongs_to :customer
  belongs_to :record
  validates_presence_of :customer_id, :record_id, :quantity
end
