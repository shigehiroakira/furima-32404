class PurchasesController < ApplicationController
  before_action :set_item, only: [:index,:create]

  def index
    @user_purchase = UserPurchase.new
   end

  def create
  @user_purchase = UserPurchase.new(purchase_params)
   if @user_purchase.valid?
    pay_item
     @user_purchase.save
     redirect_to root_path
   else
      render action: :index
   end
  end


  private
   def purchase_params
    params.require(:user_purchase).permit(:post_code, :prefecture_id, :city,:address, :house_number, :building_name,:phone_number).merge(item_id:params[:item_id],user_id: current_user.id,token: params[:token])
   end

   def set_item
    @item = Item.find(params[:item_id])
   end
   
   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
       amount: @item.price,
       card: params[:token],    
      currency: 'jpy'                 
    )
  end
end
