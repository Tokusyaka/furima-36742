class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_days
  belongs_to :prefecture
  belongs_to :postage
  belongs_to :status
  belongs_to :category
  belongs_to :user

  has_one :purchase
  has_one_attached :image

  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'is out of setting range' }
  validates :product, presence: true
  validates :image, presence: true

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :delivery_days_id
  end
end
