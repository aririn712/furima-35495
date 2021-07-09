require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、passwordとpassword_confirmation、last＿name、first_name、last＿kane、first＿kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で、半角英数字が含まれていたら登録できる' do
        @user.password = 'passw0'
        @user.password_confirmation = 'passw0'
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameが漢字の時登録できる' do
        @user.last_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameがひらがなの時登録できる' do
        @user.last_name = 'やまだ'
        @user.first_name = 'たろう'
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameがカタカナの時登録できる' do
        @user.last_name = 'ヤマダ'
        @user.first_name = 'タロウ'
        expect(@user).to be_valid
      end
      it 'last_kanaとfirst_kanaがカタカナの時登録できる' do
        @user.last_kana = 'ヤマダ'
        @user.first_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameがが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        anothor_user = FactoryBot.build(:user)
        anothor_user.email = @user.email
        anothor_user.valid?
        expect(anothor_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@ついていないと登録できない' do
        @user.email = 'aaaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000p'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'password1'
        @user.password_confirmation = 'aaaaaa2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが全角以外だと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
      end
      it 'first_nameが全角以外だと登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
      end
      it 'last_kanaがカタカナ以外の全角だと登録できない' do
        @user.last_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana には全角カタカナを使用してください')
      end
      it 'last_kanaが英語だと登録できない' do
        @user.last_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana には全角カタカナを使用してください')
      end
      it 'first_kanaがカタカナ以外の全角だと登録できない' do
        @user.first_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana には全角カタカナを使用してください')
      end
      it 'first_kanaが英語だと登録できない' do
        @user.first_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana には全角カタカナを使用してください')
      end
    end
  end
end
