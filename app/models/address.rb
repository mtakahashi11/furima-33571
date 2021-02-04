class Address < ApplicationRecord
  with_options presence: true do
    validates :zip_code
    validates :prefecture_id
    validates :municipality     numericality: { other_than: 1 }
    validates :street_number
    validates :building_name
    validates :telephone_number
  end

  belongs_to :purchase
end
