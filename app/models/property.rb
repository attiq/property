class Property < ActiveRecord::Base
  belongs_to :user
  has_many   :images
  belongs_to :status

  validates_presence_of     :street_address, :zip, :price, :city, :state, :beds, :baths
  validates_numericality_of :beds, :baths, :price, :zip, :sqf
end
