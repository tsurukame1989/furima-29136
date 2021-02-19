class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :order

  # Active_hash モデルのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :Delivery_fee
  belongs_to :delivery_source

  with_options presence: true do
    # 商品名が必須であること
    validates :name
    # 商品の説明が必須であること
    validates :info

    with_options numericality: { other_than: 1, message: "is invalid. must select."} do
      # カテゴリーの情報が必須であること
      validates :category_id
      # 商品の状態についての情報が必須であること
      validates :condition_id
      # 配送料の負担についての情報が必須であること
      validates :delivery_fee_id
      # 発送元の地域についての情報が必須であること
      validates :delivery_source_id
      # 発送までの日数についての情報が必須であること
      validates :delivery_days_id
      # 価格についての情報が必須であること
      validates :price, 
                # 価格の範囲が¥300~¥9,999,999の間であること
                numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to:9999999, message: "is invalid. Input 300 ~ 9999999 numbers." }
                # 販売価格は半角数字のみ保存可能であること
                format: { with: /\A[0-9]+\z/, message: "is invalid. Input half_with numbers." }
    end

  end
end

