require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_buyer).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_buyer.post_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_buyer.post_code = '1111111'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("郵便番号が正しくありません。ハイフンを含んだ半角数字を入力して下さい。")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_buyer.prefecture_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @order_buyer.municipalities = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存できないこと' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが10桁未満だと保存できないこと' do
        @order_buyer.phone_number = '999999999'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("電話番号は10文字以上で入力してください")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_buyer.phone_number = '999999999999'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @order_buyer.phone_number = '９９９９９９９９９９９'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("電話番号は数値で入力してください")
      end
      it 'phone_numberに半角のハイフンを含むと保存できないこと' do
        @order_buyer.phone_number = '99-999-999'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("電話番号は数値で入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("購入者を入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("商品を入力してください")
      end
      it "tokenが空では登録できないこと" do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
