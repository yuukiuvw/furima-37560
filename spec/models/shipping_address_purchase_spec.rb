require 'rails_helper'

RSpec.describe ShippingAddressPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @shipping_address_purchase = FactoryBot.build(:shipping_address_purchase, user_id: user.id, item_id: item.id)
    sleep 0.1
  end


  context '内容に問題ない場合' do
    it "tokenとpost_codeとprefecture_idとmunicipalityとaddressとphone_numberがあれば保存ができること" do
      expect(@shipping_address_purchase).to be_valid
    end
  
    it "building_nameは空でも保存できること" do
      @shipping_address_purchase.building_name = ''
      expect(@shipping_address_purchase).to be_valid
    end
  end

 context '内容に問題がある場合' do

  it "tokenが空では登録できないこと" do
    @shipping_address_purchase.token = nil
    @shipping_address_purchase.valid?
    expect(@shipping_address_purchase.errors.full_messages).to include("Token can't be blank")
  end

 it "郵便番号が空では登録できないこと" do
    @shipping_address_purchase.post_code = ""
    @shipping_address_purchase.valid?
    expect(@shipping_address_purchase.errors.full_messages).to include("Post code can't be blank")
  end

 it "郵便番号は、「3桁ハイフン4桁」の半角文字列以外保存できないこと" do
  @shipping_address_purchase.post_code = "1234567"
  @shipping_address_purchase.valid?
  expect(@shipping_address_purchase.errors.full_messages).to include("Post code is invalid")
end

it "都道府県に「---」が選択されている場合は出品できない" do
  @shipping_address_purchase.prefecture_id = '0'
  @shipping_address_purchase.valid?
  expect(@shipping_address_purchase.errors.full_messages).to include('Prefecture must be other than 0')
end

it "市区町村が空では登録できないこと" do
  @shipping_address_purchase.municipality = ""
  @shipping_address_purchase.valid?
  expect(@shipping_address_purchase.errors.full_messages).to include("Municipality can't be blank")
end

it "電話番号が空では登録できないこと" do
  @shipping_address_purchase.phone_number = ""
  @shipping_address_purchase.valid?
  expect(@shipping_address_purchase.errors.full_messages).to include("Phone number can't be blank")
end

end
end
