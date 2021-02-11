class ItemPurchase
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :zip_code,         format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id,    numericality: { other_than: 1 }
    validates :municipality
    validates :street_number
    validates :telephone_number, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number,
                   building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
