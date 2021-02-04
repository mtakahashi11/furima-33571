class Item < ApplicationRecord
  with_options presence: true do
      validates :name,        length: { maximum: 40 }
      validates :description, length: { maximum: 1000 }
      validates :category_id,      numericality: { other_than: 1 }
      validates :condition_id,     numericality: { other_than: 1 }
      validates :delivery_fee_id,  numericality: { other_than: 1 }
      validates :prefecture_id,    numericality: { other_than: 1 }
      validates :delivery_date_id, numericality: { other_than: 1 }
      validates :image
      with_options format: { with: /\A[0-9]+\z/ } do
        validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }
      end
  end

  has_one    :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_date
end
