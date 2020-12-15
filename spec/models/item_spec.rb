require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
  end

  describe "出品された商品の保存"do
    context "出品された商品が保存できる場合"do
      it"全てが入力されていれば保存できる"do
      end
    end
    
    context "出品された商品が保存できない場合" do
      it "ユーザーが紐づいていないと保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
      end

      it "商品名が書かれていないと出品できない"do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が書かれていないと出品できない"do
      @item.description  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "カテゴリーの情報が選択されていないと出品されない"do
      @item.category_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "category_idが0だとと出品されない"do
      @item.category_id  = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it "商品の状態について選択されていないと出品されない"do
      @item.status_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "status_idが0だと出品されない"do
      @item.status_id  = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
      end

      it "配送料の負担についての情報が選択されていないと出品できない"do
      @item.shipping_cost_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it "shipping_cost_idが0だと出品できない"do
      @item.shipping_cost_id  = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 0")
      end

      it "発送元の地域が選択されていないと出品できない"do
      @item.prefecture_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "prefecture_idが0だと出品できない"do
      @item.prefecture_id  = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it "発送までの日数が選択されていないと出品できない"do
      @item.shipping_day_id  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "shipping_day_idが0だと出品できない"do
      @item.shipping_day_id  = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 0")
      end

      it "価格についての情報が選択されていないと出品できない"do
      @item.price  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格が全角数字だと出品されない"do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
      end
  
      it "販売価格が半角英字だと出品されない"do
      @item.price = "aaaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it "販売価格が半角英数が混合だとだと出品されない"do
      @item.price = "aaa111"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
      end


      it "価格が、299円だと保存はされない"do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "価格が、100,000000円だと保存はされない"do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'imageカラムが空の場合コメントは保存できない' do
        @item.image = nil
          @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      
      end

    end
  end
end
