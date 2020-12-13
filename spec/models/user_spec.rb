require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全て入力されればうまくいく" do
        expect(@user).to be_valid
      end
    end


    context "新規登録がうまくいかないとき"do
      it "nicknameが空だと登録できない"do
      @user.nickname = nil
      @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "苗字がないと登録できない"do
      @user.family_name = nil
      @user.valid?
       expect(@user.errors.full_messages).to include("Family name can't be blank")
     
      end
      it "名前がないと登録できない"do
      @user.first_name = nil
      @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "苗字と名前がどちらも存在しないと登録できない"do
      @user.family_name = "山田"
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "苗字が漢字、カナ、ひらがな以外だと登録できない"do
      @user.family_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角ひらがな・カタカナ・漢字で入力してください")
      end

      it "名前がが漢字、カナ、ひらがな以外だと登録できない"do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角ひらがな・カタカナ・漢字で入力してください")

      end

      it "苗字のカナがないと登録できない"do
      @user.family_name_kana = nil
      @user.valid?
       expect(@user.errors.full_messages).to include("Family name kana can't be blank")
     
      end
      it "名前のカナがないと登録できない"do
      @user.first_name_kana = nil
      @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "苗字のカナと名前のカナがないと登録できない"do
       @user.family_name_kana = "ヤマダ"
       @user.first_name_kana = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "苗字のカナがカタカナではないとき登録できいない"do
      @user.family_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana 全角カタカナで入力してください")
     
     end

     it "苗字のカナがカタカナではないとき登録できいない"do
     @user.first_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力してください")
     
     end

      it "emailが空だと登録できない"do
      @user.email = nil
      @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     
      end
      it "重複したemailだと登録できない"do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "メールアドレスに@が含まれないと保存できない"do
      @user.email = 'sample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    
      end
      it "パスワードがないと保存できない"do
      @user.password = nil
      @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが5文字以下だと登録できない"do
      @user.password = "a1b1c"
      @user.password_confirmation = "a1b1c"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

      end
      it "パスワードは半角英数字が混合ではないので登録できない"do
       @user.password = "aaaaaa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが半角英字のみの場合登録できない"do
      @user.password = "aaaaaa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "passwordが半角数字のみの場合登録できない"do
      @user.password = "111111"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "passwordがz全角英数字のみの場合登録できない"do
      @user.password = "AAAAAA"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it 'password_confirmationが空では登録できないこと' do
        @user.password_confirmation = ""
        @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")

      end
      it "生年月日がないと登録できない"do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end