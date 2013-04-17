class Order < ActiveRecord::Base
  has_many :line_items
  has_many :records, :through => :line_items
  belongs_to :customer
end
