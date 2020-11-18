require 'rails_helper'

RSpec.describe PurchaseReceiver, type: :model do
  
  before do
    @purchase_receiver = FactoryBot.build(:purchase_receiver)
  end

  describe '商品購入機能' do

    context '購入がうまくいくとき' do
      it "zip_code、departure_are_id、address、street_number、phone_number、tokenが正しく入力されていれば購入できる" do
        expect(@purchase_receiver).to be_valid
      end

      it "建物名が空欄でも購入できる" do
        @purchase_receiver.building_name = nil
        @purchase_receiver.valid?
        expect(@purchase_receiver).to be_valid
      end 

    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空の場合は購入できない' do
        @purchase_receiver.zip_code = nil
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号にハイフンがなければ購入できない' do
        @purchase_receiver.zip_code = '1111111'
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end

      it '郵便番号が7桁でなければ購入できない' do
        @purchase_receiver.zip_code = '1111-1111'
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)", "Zip code is too long (maximum is 8 characters)")
      end

      it '都道府県が空の場合は購入できない' do
        @purchase_receiver.departure_area_id = nil
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Departure area can't be blank", "Departure area can't be blank")
      end
      
      it '都道府県が0の場合は購入できない' do
        @purchase_receiver.departure_area_id = 0
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include( )
      end
      
      it '市区町村が空の場合は購入できない' do
        @purchase_receiver.address = nil
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Address can't be blank")
      end
    
      it '番地が空の場合は購入できない' do
        @purchase_receiver.street_number = nil
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号が空の場合は保購入きない' do
        @purchase_receiver.phone_number = nil
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Phone number can't be blank")
      end
  
      it '電話番号が９桁未満の場合は購入できない' do
        @purchase_receiver.phone_number = 01234567
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include( )
      end

      it '電話番号が12桁以上の場合は購入できない' do
        @purchase_receiver.phone_number = 111111111111
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include( )
      end
  
      it '電話番号にハイフンがある場合は購入できない' do
        @purchase_receiver.phone_number = "#{123}-#{456}-#{789}"
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Phone number is invalid")
      end

      it 'トークンが空の場合は購入できない' do
        @purchase_receiver.token = nil
        @purchase_receiver.valid?
        expect(@purchase_receiver.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end

