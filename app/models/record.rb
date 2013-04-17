class Record < ActiveRecord::Base
  has_many :line_items
  has_many :cart_items
  belongs_to :artist
end
