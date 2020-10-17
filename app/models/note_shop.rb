class NoteShop
  include ActiveModel::Model
  attr_accessor :name, :rating, :comment, :image, :bitter, :acidity, :aroma, :body, :roast_date, :grams, :price, :user_id, :shop_name, :purchase_date, :location
  include ActiveRecord::AttributeAssignment

  with_options presence: true do
    # 記録に関するバリデーション
    validates :name
    validates :image
    validates :rating
    # お店に関するバリデーション
    validates :shop_name
  end

  def save
    # 記録の情報を保存
    note = Note.create(name: name, rating: rating, image: image, comment: comment, bitter: bitter, acidity: acidity, aroma: aroma, body: body, roast_date: roast_date, grams: grams, price: price, user_id: user_id)
    # お店の情報を保存
    shop = Shop.create(shop_name: shop_name, purchase_date: purchase_date, location: location, note_id: note.id)
  end

end