FactoryBot.define do
  factory :purchase_delivery do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '札幌市' }
    block_number { '10-10' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
