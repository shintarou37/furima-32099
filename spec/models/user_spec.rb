require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が要件を満たしている場合' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do

      it "ユーザー本名は、名字が必須であること" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end

      it "ユーザー本名は、名前が必須であること" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end

      it 'ニックネームが必須であること' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'メールアドレスがない時' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user =FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
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

      it 'パスワードが6文字より少ない時' do
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

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password = 'aaaaa11'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = "1111111"
        @user.password_confirmation = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "ユーザー本名(苗字)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "ユーザー本名(名前)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
  
      it "ユーザー本名のフリガナは、名前が必須であること" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end

      it "ユーザー本名のフリガナは、名字が必須であること" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
  
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.first_name_kana = "嗚呼"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.last_name_kana = "嗚呼"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
  
      it "生年月日が必須であること" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end