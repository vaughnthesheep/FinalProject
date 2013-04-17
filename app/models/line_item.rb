class LineItem < ActiveRecord::Base
  belongs_to :record
  belongs_to :order
  validates_presence_of :record_id, :order_id, :quantity
end
