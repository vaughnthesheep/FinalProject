class LineItem < ActiveRecord::Base
  belongs_to :record
  belongs_to :order
end
