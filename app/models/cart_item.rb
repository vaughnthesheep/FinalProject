class CartItem < ActiveRecord::Base
  belongs_to :customer
  belongs_to :record
end
