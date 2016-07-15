class Property < ApplicationRecord

  has_one :gallery
  has_many :pictures, through: :gallery

end
