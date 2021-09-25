class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :block_number, :phone, :building_name,
                :purchase_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :block_number
    validates :phone, numericality: { only_integer: true, message: 'is invalid. Input half-width characters without hyphen(-)' }
  end

  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :phone, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'is invalid. Input only number' }
  validates :phone, length: { minimum: 10, maximum: 11 }
  def save
    # 購入情報を保存し、変数purchaseに代入する
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 配送先を保存する
    # purchase_idには変数purchaseのidと指定する
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities,
                    block_number: block_number, phone: phone, building_name: building_name, purchase_id: purchase.id)
  end
end
