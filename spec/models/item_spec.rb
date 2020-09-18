require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context "出品がうまくいくとき" do
      it "商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格があれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "出品がうまくいかないとき" do
      it "商品名がないと出品できない" do
        @item.name =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明がないと出品できない" do
        @item.text =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "カテゴリーの情報がないと出品できない" do
        @item.category_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態がないと出品できない" do
        @item.status_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担について情報がないと出品できない" do
        @item.delivery_fee_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "発送元の地域についての情報がないと出品できない" do
        @item.shipping_area_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "発送までの日数につての情報がないと出品できない" do
        @item.delivery_time_id =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it "価格についての情報がないと出品できない" do
        @item.price =""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格は半角数字でないと出品できない" do
        @item.price ="１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

    end
  end
end