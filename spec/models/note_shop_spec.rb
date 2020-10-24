require 'rails_helper'

RSpec.describe NoteShop, type: :model do
  before do
    @note_shop = FactoryBot.build(:note_shop)
    @note_shop.image = fixture_file_upload('public/images/test_image.png')
  end
  
    describe '記録の新規投稿' do
      it "全ての情報が存在すれば投稿できる" do
        expect(@note_shop).to be_valid
      end
  
      it "nameが空では投稿できないこと" do
        @note_shop.name = nil
        @note_shop.valid?
        expect(@note_shop.errors.full_messages).to include("Name can't be blank")
      end
  
      it "ratingが空では投稿できないこと" do
        @note_shop.rating = nil
        @note_shop.valid?
        expect(@note_shop.errors.full_messages).to include("Rating can't be blank")
      end
  
      it "imageが空では投稿できないこと" do
        @note_shop.image = nil
        @note_shop.valid?
        expect(@note_shop.errors.full_messages).to include("Image can't be blank")
      end
  
      it "shop_nameが空では投稿できないこと" do
        @note_shop.shop_name = nil
        @note_shop.valid?
        expect(@note_shop.errors.full_messages).to include("Shop name can't be blank")
      end
    end
end
