require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "ニックネームが空では登録できない" do
    end
    it "メールアドレスが空では登録できない" do
    end
    it "重複したメールアドレスが存在する場合登録できない" do
    end
    it "メールアドレスに@が含まれていないと登録できない" do
    end
    it "パスワードが空では登録できない" do
    end
    it "パスワードが５文字以下だと登録できない" do
    end
    it "パスワードに全角文字が含まれていると登録できない" do
    end
    it "パスワードが半角英語だけでは登録できない" do
    end
    it "パスワードが半角数字だけでは登録できない" do
    end
    it "パスワード（確認用）が空では登録できない" do
    end
    it "パスワードとパスワード（確認用）の値が一致していないと登録できない" do
    end
    it "ユーザー本名の名字が空では登録できない" do
    end
    it "ユーザー本名の名前が空では登録できない" do
    end
    it "ユーザー本名の名字のフリガナが空では登録できない" do
    end
    it "ユーザー本名の名前のフリガナが空では登録できない" do
    end
    it "生年月日の年が空では登録できない" do
    end
    it "生年月日の月が空では登録できない" do
    end
    it "生年月日の日が空では登録できない" do
    end
  end
end
