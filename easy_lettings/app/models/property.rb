class Property < ApplicationRecord

  has_many :pictures, dependent: :destroy

end
