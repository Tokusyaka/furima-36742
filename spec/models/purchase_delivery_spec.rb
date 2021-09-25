require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: @user.id, item_id: @item.id)
    sleep(2)
  end

  describe '商品購入' do
    context '商品を購入できる時' do
      it '入力項目が全て入力できている場合' do
        expect(@purchase_delivery).to be_valid
      end

      it '建物名は空でも保存できる' do
        @purchase_delivery.building_name = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '商品購入できない場合' do
      it '郵便番号が空の場合' do
        @purchase_delivery.post_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が3桁ハイフン4桁でない場合' do
        @purchase_delivery.post_code = '1234567'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '郵便番号が全角入力の場合' do
        @purchase_delivery.post_code = '１２３−４５６７'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が空の場合' do
        @purchase_delivery.prefecture_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空の場合' do
        @purchase_delivery.municipalities = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空の場合' do
        @purchase_delivery.block_number = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号が空の場合' do
        @purchase_delivery.phone = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が9桁以下の場合' do
        @purchase_delivery.phone = '090123456'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone is too short (minimum is 10 characters)')
      end
      it '電話番号が12桁以上の場合' do
        @purchase_delivery.phone = '090123456789'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
      it '電話番号が全角入力の場合' do
        @purchase_delivery.phone = '０９０１２３４５６７８'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone is invalid. Input half-width characters without hyphen(-)')
      end
      it '電話番号にハイフンがある場合' do
        @purchase_delivery.phone = '090-1234-5678'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone is invalid. Input only number')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_delivery.token = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
