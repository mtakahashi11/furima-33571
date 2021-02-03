require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'imaegとnameとdescription、category_idとcondition_id、delivery_fee_idとprefecture_id、delivery_date_idとpriceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imaegが空だと登録できない' do
        @item.image = nil
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと登録できない' do
        @item.description = ''
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = '---'
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = '---'
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end
      it 'delivery_fee_idが空だと登録できない' do
        @item.delivery_fee_id = '---'
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include('Delivery fee is not a number')
      end
      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = '---'
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'delivery_date_idが空だと登録できない' do
        @item.delivery_date_id = '---'
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include('Delivery date is not a number')
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        # binding.pry
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
