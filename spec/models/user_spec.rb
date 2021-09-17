require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる時' do
      it '入力項目が全て入力されている時' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できない時' do
      it 'nicknameが空の場合' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の場合' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが、@を含まない場合' do
        @user.email = 'aaaaaaa.aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '空では登録できない場合' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '数字のみのパスワードの場合' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both half-width characters and numbers")
      end
      it '全角文字を含むパスワードの場合' do
        @user.password = '０００ＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both half-width characters and numbers")
      end
      it 'passwordが、5文字以下の場合' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが、半角英数字混合でない場合' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both half-width characters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致の場合' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角)のfirst_nameが空の場合' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)のlast_nameが空の場合' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)のfirst_nameが、全角（漢字・ひらがな・カタカナ）以外での入力だった場合' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
      it 'お名前(全角)のlast_nameが、全角（漢字・ひらがな・カタカナ）以外での入力だった場合' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
      it 'お名前カナ(全角)のfirst_name_kanaが空の場合' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)のlast_name_kanaが空の場合' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)のfirst_name_kanaが、全角（カタカナ）以外での入力だった場合' do
        @user.first_name_kana = 'ｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
      it 'お名前カナ(全角)のlast_name_kanaが、全角（カタカナ）以外での入力だった場合' do
        @user.last_name_kana = 'ｱｱｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
      it 'birthdayが空の場合' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
