require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase)
  end

  describe "購入の登録"do
   context "購入登録がうまくいく時"do
    it "全ての情報が入力されていたら登録される"do
    expect(@user_purchase).to be_valid
    end
    
    it "建物名がなくても他が全て入力されていれば登録はうまく行く"do
      @user_purchase.building_name = nil
      expect(@user_purchase).to be_valid
    end
   end

   context "購入登録がうまくいかない時"do

    it "post_codeが空だと登録できない"do
     @user_purchase.post_code = nil
     @user_purchase.valid?
     expect(@user_purchase.errors.full_messages).to include("Post code can't be blank")
    end
    
    it "prefecture_idが空だと登録できない"do
    @user_purchase.prefecture_id = nil
     @user_purchase.valid?
     expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "cityが空だと登録できない"do
    @user_purchase.city = nil
     @user_purchase.valid?
     expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空だと登録できない"do
    @user_purchase.address = nil
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
   
    end

    it "addressが全角だと登録できない"do
    @user_purchase.address = "０００"
     @user_purchase.valid?
     expect(@user_purchase.errors.full_messages).to include("Address is invalid")
    
    end

    it "phone_numberが空だと登録できない"do
    @user_purchase.phone_number = nil
     @user_purchase.valid?
     expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    
    end

    it "phone_numberが全角だと登録できない"do
     @user_purchase.phone_number = "０００００００００００"
     @user_purchase.valid?
     expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが11桁以外だとと登録できない"do
    @user_purchase.phone_number = "0900000000000"
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
   
    end

    it "phone_numberが050,070,080,090以外から始まると登録できない"do
    @user_purchase.phone_number = "04000000000"
    @user_purchase.valid?
    expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
   
    end


   end
  end
end
