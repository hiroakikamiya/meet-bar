require 'rails_helper'
describe User do
  describe '#create' do
    it 'is invalid without a name' do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("は1文字以上で入力してください")
    end
    it 'メールアドレスが無い場合' do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it 'メールアドレスに@場合' do
      user = build(:user, email: "aa.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    it 'パスワードがない場合' do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it '確認用パスワードがない場合' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
  end
end
