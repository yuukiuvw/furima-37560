FactoryBot.define do
  factory :shipping_address_purchase do
    token         {"tok_abcdefghijk00000000000000000"}
    post_code     {"111-1111"}
    prefecture_id { 1 }
    municipality  {"市町村"}
    address       {"番地"}
    phone_number  {"09012345678"}

  end
end