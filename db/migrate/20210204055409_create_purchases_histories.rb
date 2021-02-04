class CreatePurchasesHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases_histories do |t|

      t.string     :zip_code,         null: false
      t.integer    :prefecture_id,    null: false
      t.string     :municipality,     null: false
      t.string     :street_number,    null: false
      t.string     :building_name
      t.string     :telephone_number, null: false
      t.references :purchaser,        foreign_key: true
      t.timestamps
    end
  end
end
