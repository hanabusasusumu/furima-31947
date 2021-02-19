require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '購入情報' do
    context '購入できるとき' do
      it '建物名以外のすべての欄が入力されていれば購入できる' do
        expect(@user_order).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号が空だと購入できない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @user_order.postal_code = '1111111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が選択されていないと購入できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture select")
      end
      it '市区町村が空だと購入できない' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @user_order.house_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあり12桁以上だと購入できない' do
        @user_order.phone_number = '090-1234-5678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
