require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @address_order = FactoryBot.build(:address_order)
  end

  describe '商品購入情報の保存' do
    context '購入情報が登録できるとき' do
      it 'building以外の全ての項目が入力されていれば保存できること' do
        expect(@address_order).to be_valid
      end
    end

    context '購入情報が登録できないとき' do
      it 'tokenがなければ登録できないこと' do
        @address_order.token = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postcodeが空では登録できないこと' do
        @address_order.postcode = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeはハイフン( - )を含むこと' do
        @address_order.postcode = '1110000'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode include hyphen(-)")
      end

      it 'postcodeは8文字以内で入力すること' do
        @address_order.postcode = '1234-12345'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postcode is too long (maximum is 8 characters)")
      end


      it 'prefectureが空では登録できないこと' do
        @address_order.prefecture_id = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureが{id: 1}では登録できないこと' do
        @address_order.prefecture_id = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空では登録できないこと' do
        @address_order.city = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では登録できないこと' do
        @address_order.block = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @address_order.phone_number = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは11桁以上では登録できないこと' do
        @address_order.phone_number = '090111122223'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      
      it 'phone_numberはハイフンありでは登録できないこと' do
        @address_order.phone_number = '090-1234-1234'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end