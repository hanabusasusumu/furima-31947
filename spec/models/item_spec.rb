require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できるとき' do
      it 'すべての欄が入力されていれば出品できる' do
        expect(@item).to be_valid
      end

      it '販売価格が300~9,999,999だと登録できる'do
      
      end

      it '販売価格が半角数字での入力だと登録できる' do
      
      end
    end

    context '出品できないとき' do
      it '商品画像が空だと登録できない'do
       
      end

      it '商品名が空だと登録できない' do
      
      end

      it '商品の説明が空だと登録できない' do
        
      end

      it 'カテゴリーが選択されていないと登録できない' do
        
      end

      it '商品の状態が選択されていないと登録できない' do
        
      end
      
      it '配送料の負担が選択されていないと登録できない' do
        
      end

      it '発送元の地域が選択されていないと登録できない' do
        
      end

      it '発送日までの日数が選択されていないと登録できない' do
        
      end

      it '価格が空だと登録できない' do
        
      end

      it '価格が半角数字以外だと登録できない' do
        
      end

      it '価格が¥299以下だと登録できない' do
        
      end
       
      it '価格が¥10,000,000以上だと登録できない' do
        
      end

    end
  end
end
