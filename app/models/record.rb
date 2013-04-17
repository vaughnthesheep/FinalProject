class Record < ActiveRecord::Base
  has_many :line_items
  has_many :cart_items
  belongs_to :artist
  validates_presence_of :artist_id, :name, :price, :image
end
