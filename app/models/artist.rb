class Artist < ActiveRecord::Base
  has_many :records
  validates_presence_of :name, :bio, :image
end
