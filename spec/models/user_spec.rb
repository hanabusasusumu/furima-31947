require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての欄が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it '重複したメールアドレスが存在していなければ登録できる' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = 'test@test'
        expect(another_user).to be_valid
      end
      it 'メールアドレスに@が含まれていると登録できる' do
        @user.email = 'test@example'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上かつ、半角英数字混合での入力だと登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'パスワードとパスワード（確認用）の値が一致していると登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字が全角（漢字・ひらがな・カタカナ）の入力だと登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名前が全角（漢字・ひらがな・カタカナ）の入力だと登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名字のフリガナが全角（カタカナ）の入力だと登録できる' do
        @user.last_name_furigana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名の名前のフリガナが全角（カタカナ）の入力だと登録できる' do
        @user.first_name_furigana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに@が含まれていないと登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが５文字以下だと登録できない' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英語だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが半角数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワード（確認用）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードとパスワード（確認用）の値が一致していないと登録できない' do
        @user.password = '000aaa'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
      end
      it 'ユーザー本名の名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
      end
      it 'ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）以外が含まれていると登録できない' do
        @user.last_name = 'Yama田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）以外が含まれていると登録できない' do
        @user.first_name = 'Ta郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'ユーザー本名の名字のフリガナが空では登録できない' do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank", 'Last name furigana 全角カナ文字を使用してください')
      end
      it 'ユーザー本名の名前のフリガナが空では登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank", 'First name furigana 全角カナ文字を使用してください')
      end
      it 'ユーザー本名の名字のフリガナは全角（カタカナ）以外が含まれていると登録できない' do
        @user.last_name_furigana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name furigana 全角カナ文字を使用してください')
      end
      it 'ユーザー本名の名前のフリガナは全角（カタカナ）以外が含まれていると登録できない' do
        @user.first_name_furigana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furigana 全角カナ文字を使用してください')
      end
      it '生年月日の年が空では登録できない' do
        @user.birthday = ' -1-1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '生年月日の月が空では登録できない' do
        @user.birthday = '1930- -1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '生年月日の日が空では登録できない' do
        @user.birthday = '1930-1- '
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
