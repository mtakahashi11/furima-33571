class Purchaser < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :purchases_history
end
