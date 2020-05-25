require 'rails_helper'
describe Item do
  describe '#create' do

    # it "必須項目が全て入力されていれば出品できる" do
    #   item = build(:item)
    #   expect(item).to be_valid
    # end
# item = Item.new(name: "服", introduction: "新品です", postage_type: "未定", shipping_area: "北海道", trading_status: "未使用に近い", shipping_date: "１〜２日で発送", postage_payer: "送料込み(発送者負担)", price: "111", user_id: "1")
    it "nameがない場合、出品ができない" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "introdctionがない場合、出品ができない" do
      item = build(:item, introduction: "")
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

    it "postage_typeがない場合、出品ができない" do
      item = build(:item, postage_type: "")
      item.valid?
      expect(item.errors[:postage_type]).to include("can't be blank")
    end

    it "shipping_areaがない場合、出品ができない" do
      item = build(:item, shipping_area: "")
      item.valid?
      expect(item.errors[:shipping_area]).to include("can't be blank")
    end

    it "trading_statusがない場合、出品ができない" do
      item = build(:item, trading_status: "")
      item.valid?
      expect(item.errors[:trading_status]).to include("can't be blank")
    end

    it "shipping_dateがない場合、出品ができない" do
      item = build(:item, shipping_date: "")
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end

    it "postage_payerがない場合、出品ができない" do
      item = build(:item, postage_payer: "")
      item.valid?
      expect(item.errors[:postage_payer]).to include("can't be blank")
    end

    it "priceがない場合、出品ができない" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it " priceが300未満であれば出品できないこと" do
      user = build(:item, price: "299")
      user.valid?
      expect(user.errors[:price]).to include("must be greater than 299")
    end

    it " priceが10000000以上であれば出品できないこと" do
      user = build(:item, price: "10000000")
      user.valid?
      expect(user.errors[:price]).to include("must be less than 10000000")
    end

    it " priceが整数でなければ出品できないこと" do
      user = build(:item, price: "777.7")
      user.valid?
      expect(user.errors[:price]).to include("must be an integer")
    end

  end
end