require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '購入情報' do
    context '購入できるとき' do
      it '建物名以外のすべての欄が入力されていれば購入できる' do

      end
      it '郵便番号にハイフンがあると購入できる' do

      end
      it '電話番号がハイフンなしで11桁以内だと購入できる' do

      end
    end

    context '購入できないとき' do
      it '郵便番号が空だと購入できない' do

      end
      it '郵便番号にハイフンがあると購入できない' do

      end
      it '都道府県が選択されていないと購入できない' do

      end
      it '市区町村が空だと購入できない' do

      end
      it '番地が空だと購入できない' do

      end
      it '電話番号が空だと購入できない' do

      end
      it '電話番号にハイフンがあり12桁以上だと購入できない' do
        
      end
    end
  end
end
