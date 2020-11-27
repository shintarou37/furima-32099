require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user.last_name = 'あ'
    @user.first_name = 'あ'
    @user.first_name_kana = 'ア'
    @user.last_name_kana = 'ア'
    @user.birthday = 1990 - 0o1 - 0o1
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が要件を満たしている場合' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'メールアドレスがない時' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank")
      end
      it 'アドレスに@がなくて登録ができない場合' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードがない時' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", 'Password is too short (minimum is 6 characters)', 'Password is invalid')
      end
      it 'パスワードが6文字以下の時' do
        @user.password = 'a'
        @user.password_confirmation = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password is too short (minimum is 6 characters)', 'Password is invalid')
      end
      it 'パスワードとパスワード（確認用）、値が一致しない' do
        @user.password = 'aaaaa11'
        @user.password_confirmation = 'iiiii11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
