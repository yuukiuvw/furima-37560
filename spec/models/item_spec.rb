require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do 
    context '商品出品ができるとき' do
      it '商品名と商品の説明と商品の価格とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と価格と商品画像が必須であること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '商品名が空では出品できない' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

       it '商品の説明が空では出品できない' do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリの情報が空では出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
     end

      it '商品の状態が空では出品できない' do
        @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
     end

     it '配送料の負担が空では出品できない' do
      @item.shipping_charge_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
     end

     it '発送元の地域が空では出品できない' do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end

     it '発送までの日数が空では出品できない' do
      @item.days_to_ship_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
     end

     it '価格が空では出品できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
     end

     it '価格が¥300~¥9,999,999の間以外だと出品できない' do
      @item.price = "100"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

     it  '価格が半角数値以外だと出品できない' do
    @item.price = "あああ"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end

     it '商品画像が添付されていないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
  end
  end
end
