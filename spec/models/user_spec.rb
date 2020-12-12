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
      it "nicknameが必要"do
      @user.nickname = "aaa"
      expect(@user).to be_valid
      end

      it "emailが必須"do
      @user.email = "test@test"
      expect(@user).to be_valid
      end

      it "passwordが必須"do
      @user.password = "000000"
      @user.password_confirmation ="000000"
      expect(@user).to be_valid
      end


      it "メールアドレスが一意性であること"do
        @user.email = "test@test"
        expect(@user).to be_valid
      end
      it "パスワードは、6文字以上での入力が必須であること"do
        @user.password = "000000"
        @user.password_confirmation ="000000"
        expect(@user).to be_valid
      end
      it "パスワードは半角英数字混合での入力が必須であること"do
        @user.password ="aaa000"
        @user.password_confirmation ="aaa000"
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
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

      end
      it "パスワードは半角英数字が混合ではないので登録できない"do
       @user.password = "aaaaaa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationが空では登録できないこと' do
        @user.password = "000000"
        @user_password_confirmation = nil
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