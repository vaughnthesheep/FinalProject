class Contact < ActiveRecord::Base
  validates_presence_of :title, :name, :phone, :address, :email
end
