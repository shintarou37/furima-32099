require 'rails_helper'

RSpec.describe Save, type: :model do
  before do
    @save = FactoryBot.build(:save)
  end

  describe '商品購入機能' do
    context '商品購入機能が成功する' do
      it '情報を正しく入力したら決済ができる' do
        expect(@save).to be_valid
      end
    end

    context '商品購入機能が失敗する' do
      it '郵便番号がない場合' do
        @save.address = nil
        @save.valid?
        expect(@save.errors.full_messages).to include ("Address can't be blank")
      end

      it '都道府県がない場合' do
        @save.prefecture_id = nil
        @save.valid?
        expect(@save.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it '市区町村がない場合' do
        @save.town = nil
        @save.valid?
        expect(@save.errors.full_messages).to include ("Town can't be blank")
      end
      it '番地がない場合' do
        @save.post = nil
        @save.valid?
        expect(@save.errors.full_messages).to include ("Post can't be blank")
      end
      it '電話番号がない場合' do
        @save.phone = nil
        @save.valid?
        expect(@save.errors.full_messages).to include ("Phone can't be blank")
      end

      it '郵便番号にはハイフンが必要であること' do
        @save.address = '1231234'
        @save.valid?
        expect(@save.errors.full_messages).to include ("Address is invalid")
      end

      it '電話番号にはハイフンが不要であること' do
        @save.phone = "090-1234-1234"
        @save.valid?
        expect(@save.errors.full_messages).to include("Phone is invalid")
      end

      it '電話番号は11文字以内であること' do
        @save.phone = "090-1234-1234"
        @save.valid?
        expect(@save.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end
