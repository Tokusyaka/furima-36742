class Category < ActiveHash::Base
  self.data = [
    { id: 1, variety: '---' }, { id: 2, variety: 'メンズ' }, { id: 3, variety: 'レディース' },
    { id: 4, variety: 'ベビー・キッズ' }, { id: 5, variety: 'インテリア・住まい・小物' }, { id: 6, variety: '本・音楽・ゲーム' },
    { id: 7, variety: 'おもちゃ・ホビー・グッズ' }, { id: 8, variety: '家電・スマホ・カメラ' }, { id: 9, variety: 'スポーツ・レジャー' },
    { id: 10, variety: 'ハンドメイド' }, { id: 11, variety: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :item
end
