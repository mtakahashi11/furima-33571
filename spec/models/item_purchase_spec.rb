require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    buyer = FactoryBot.create(:user)
    @item_purchase = FactoryBot.build(:item_purchase, user_id: buyer.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入できるとき' do
    context 'すべての値が正しく入力されていれば商品購入できること' do
      it 'zip_codeとprefecture_id、municipalityとstreet_number、telephone_numberとtokenが存在すれば登録できる' do
        expect(@item_purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        expect(@item_purchase).to be_valid
        @item_purchase.building_name = ''
      end
    end

    context '商品購入できないとき' do
      it 'zip_codeが空だと登録できないこと' do
        @item_purchase.zip_code = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
        @item_purchase.zip_code = '1111111'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Zip code is invalid')
      end
      it 'prefecture_idが空だと登録できないこと' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalityが空だと登録できないこと' do
        @item_purchase.municipality = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'telephone_numberが空だと登録できないこと' do
        @item_purchase.telephone_number = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが半角数字でないと登録できないこと' do
        @item_purchase.telephone_number = '１２３４５６７８９１０'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが11文字でないと登録できないこと' do
        @item_purchase.telephone_number = '123456789'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @item_purchase.token = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
