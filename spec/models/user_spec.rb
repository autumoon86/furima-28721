require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、encrypted_password、first_nameとfamily_nameとfirst_name_kanaとfamily_name_kanaが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      
      it "encrypted_passwordが6文字以上であれば登録できる" do
        @user.encrypted_password = "000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは＠がないと登録できない" do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "encrypted_passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "encrypted_passwordが5文字以下であれば登録できない" do
        @user.password = "abc12"
        @user.password_confirmation = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordは半角英数字混合でないと登録できない" do
        @user.password ="abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "名字が空だと登録できない" do
        @user.family_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "名前が空だと登録できない" do
        @user.first_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "名字が全角でないと登録できない" do
        @user.family_name ="abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end

      it "名前が全角でないと登録できない" do
        @user.first_name ="tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it "名字のフリガナがないと登録できない" do
        @user.family_name_kana =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "名前のフリガナがないと登録できない" do
        @user.first_name_kana =""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "名字のフリガナが全角カタカナでないと登録できない" do
        @user.family_name_kana ="あべ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid. Input full-width katakana characters.")
      end

      it "名前のフリガナが全角カタカナでないと登録できない" do
        @user.first_name_kana ="たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it "誕生日が空だと登録できない" do
        @user.birthday =""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end