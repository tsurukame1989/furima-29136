require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規出品' do
    context '新規出品できるとき' do
      it 'image,name,info,category_id,condition_id,delivery_fee_id,delivery_source_id,delivery_days_id,price,が全て入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      it 'nameが40字以内であれば出品できる' do
        @item.name = Faker::Lorem.characters(number: 40)
        expect(@item).to be_valid
      end
      it 'infoが1000字以内であれば出品できる' do
        @item.info = Faker::Lorem.characters(number: 1000)
        expect(@item).to be_valid
      end
      it 'category_idが1以外(2~11)が選択されていれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'condition_idが1以外(2~7)が選択されていれば出品できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it 'delivery_fee_idが1以外(2~3)が選択されていれば出品できる' do
        @item.delivery_fee_id = 2
        expect(@item).to be_valid
      end
      it 'delivery_source_idが1以外(2~48)が選択されていれば出品できる' do
        @item.delivery_source_id = 2
        expect(@item).to be_valid
      end
      it 'priceの値が300〜9999999なら出品できる(300の場合）' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceの値が300〜9999999なら出品できる(9999999の場合）' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
      it 'priceの値が半角数字なら出品できる' do
        @item.price = 30000
        expect(@item).to be_valid
      end
    end
    context '新規出品できないとき' do
      it 'imageが空の場合は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image Is invalid. Must attach some file.")
      end
      it 'nameが空の場合は出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40字より多い場合は出品できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'infoが空の場合は出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'infoが1000字より多い場合は出品できない' do
        @item.info = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Info is too long (maximum is 1000 characters)")
      end
      it 'category_idが初期の1が選択されてる場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid. must select.")
      end
      it 'condition_idが初期の1が選択されてる場合は出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is invalid. must select.")
      end
      it 'delivery_fee_idが初期の1が選択されてる場合は出品できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is invalid. must select.")
      end
      it 'delivery_source_idが初期の1が選択されてる場合は出品できない' do
        @item.delivery_source_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source is invalid. must select.")
      end
      it 'delivery_days_idが初期の1が選択されてる場合は出品できない' do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days is invalid. must select.")
      end
      it 'priceが空の場合は出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceの値が300以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half_with 300 ~ 9999999 numbers.")
      end
      it 'priceの値が9999999以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half_with 300 ~ 9999999 numbers.")
      end
      it 'priceの値が半角数字以外の入力では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half_with 300 ~ 9999999 numbers.")
      end
    end
  end
end

