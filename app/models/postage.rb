class Postage < ActiveHash::Base
  self.data = [
    { id: 1, cash: '---' }, { id: 2, cash: '着払い(購入者負担)' }, { id: 3, cash: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :item
end
